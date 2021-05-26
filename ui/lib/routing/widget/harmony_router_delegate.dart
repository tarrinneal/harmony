import 'package:flutter/widgets.dart';

class HarmonyRouterDelegate extends RouterDelegate<HarmonyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<HarmonyRoutePath> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
    );
  }

  @override
  Future<void> setNewRoutePath(HarmonyRoutePath path) async {
    if (path.isUnkown) return;
  }
}

class HarmonyRoutePath {
  const HarmonyRoutePath({required this.validPaths, required this.curPath});

  final List<String> validPaths;
  final String curPath;

  bool get isUnkown => validPaths.any((path) => path == curPath);
}
