import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harmony/app_shell/app_shell.dart';
import 'package:harmony/routing/config/harmony_route_path.dart';
import 'package:harmony/routing/config/app_route_state.dart';
import 'package:harmony/spec/spec.dart';

final pageToPathMap = <HarmonyPage, HarmonyRoutePath>{
  HarmonyPage.unknown: UnknownRoutePath(),
  HarmonyPage.welcome: WelcomeRotuePath(),
  HarmonyPage.splash: SplashRoutePath(),
};

final _assetName = 'assets/Harmony.svg';

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

    return Navigator(
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
            child: _TempSplashPage(
              onComplete: () {
                appState.selectedPage = HarmonyPage.welcome;
              },
            ),
          ),
        if (appState.selectedPage == HarmonyPage.welcome)
          MaterialPage(
            child: Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () {
                    appState.serverId = 'home';
                    appState.selectedPage = HarmonyPage.server;
                  },
                  child: Text('Go to AppShell'),
                ),
              ),
            ),
          ),
        if (appState.selectedPage == HarmonyPage.server)
          MaterialPage(
            child: AppShell(),
          ),
      ],
      onPopPage: _onPopPage,
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

class _TempSplashPage extends StatefulWidget {
  _TempSplashPage({required this.onComplete});

  final VoidCallback onComplete;
  @override
  __TempSplashPageState createState() => __TempSplashPageState();
}

// TODO(#32): Create a Splash page for users's loading the application
class __TempSplashPageState extends State<_TempSplashPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) widget.onComplete();
    })
    ..forward();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutCubic,
  ).drive(Tween(begin: 0, end: 4.25));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logoSvg = SvgPicture.asset(
      _assetName,
      semanticsLabel: 'Harmony Logo',
      fit: BoxFit.scaleDown,
      height: Sizing.serverSideBarWidth,
    );
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: TextButton(
            onPressed: widget.onComplete,
            child: logoSvg,
          ),
        ),
      ),
    );
  }
}
