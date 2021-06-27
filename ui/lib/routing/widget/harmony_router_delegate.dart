import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:harmony/app_shell/app_shell.dart';
import 'package:harmony/splash/splash.dart';
import 'package:harmony/login/login.dart';
import 'package:harmony/state/state.dart';
import 'package:harmony/welcome/welcome.dart';

import '../config/harmony_route_path.dart';

final pageToPathMap = <HarmonyPage, HarmonyRoutePath>{
  HarmonyPage.unknown: UnknownRoutePath(),
  HarmonyPage.welcome: WelcomeRotuePath(),
  HarmonyPage.splash: SplashRoutePath(),
};

class HarmonyRouterDelegate extends RouterDelegate<HarmonyRoutePath>
    with PopNavigatorRouterDelegateMixin<HarmonyRoutePath>, ChangeNotifier {
  HarmonyRouterDelegate(this.appState) {
    appState.addListener(notifyListeners);
  }

  final AppRouteState appState;
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  // Used to get a RoutePath based on the current value of Application state
  @override
  HarmonyRoutePath? get currentConfiguration {
    HarmonyRoutePath? path = pageToPathMap[appState.selectedPage];

    if (path == null) {
      if (appState.serverId == null) path = UnknownRoutePath();
      path = AppShellRoutePath(appState.serverId!);
    }
    return path;
  }

  @override
  Widget build(BuildContext context) {
    bool _onPopPage(Route route, dynamic result) {
      print('_onPopPage called');
      appState.goBack();
      return route.didPop(result);
    }

    return AppRouteScope(
      appState,
      child: Navigator(
        key: navigatorKey,
        // TODO(#29): Refactor building pages away from gross if statments to a
        // provided map based off of provided
        pages: [
          if (appState.selectedPage == HarmonyPage.unknown)
            MaterialPage(
              child: Scaffold(
                body: Center(
                  child: Text('Woops Unknown'),
                ),
              ),
            ),
          if (appState.selectedPage == HarmonyPage.splash)
            MaterialPage(
              child: SplashPage(
                onComplete: () {
                  appState.selectedPage = HarmonyPage.welcome;
                },
              ),
            ),
          if (appState.selectedPage == HarmonyPage.welcome)
            MaterialPage(
              child: WelcomePage(),
            ),
          if (appState.selectedPage == HarmonyPage.login)
            MaterialPage(
              child: LoginPage(),
            ),
          if (appState.selectedPage == HarmonyPage.server)
            MaterialPage(
              child: AppShell(),
            ),
        ],
        onPopPage: _onPopPage,
      ),
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  // Used to update Application state when provided with a RoutePath
  @override
  Future<void> setNewRoutePath(HarmonyRoutePath configuration) {
    if (configuration is UnknownRoutePath) {
      appState.selectedPage = HarmonyPage.unknown;
    }

    if (configuration is SplashRoutePath) {
      _setPage(HarmonyPage.splash);
    }

    if (configuration is WelcomeRotuePath) {
      _setPage(HarmonyPage.welcome);
    }
    if (configuration is AppShellRoutePath) _setPage(HarmonyPage.server);
    return Future.value(null);
  }

  void _setPage(HarmonyPage page) {
    appState.selectedPage = page;
  }
}

class AppRouteScope extends InheritedWidget {
  const AppRouteScope(this.data, {Key? key, required Widget child})
      : super(key: key, child: child);

  final AppRouteState data;

  static AppRouteState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppRouteScope>();

    assert(scope != null);
    return scope!.data;
  }

  // TODO(): Replace by comparing oldWidget.data to current data.
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
