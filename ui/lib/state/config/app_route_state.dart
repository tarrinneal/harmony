import 'package:flutter/widgets.dart';

import 'harmony_page.dart';

/// This class represents the routing state for the application
///
/// AppStart ==> SplashPage
/// UserAuthSuccess ==> ChannelSelected ? AppShell/server : AppShell/home
/// UserAuthFailure ==> WelcomePage
class AppRouteState with ChangeNotifier {
  AppRouteState({required bool authenticated})
      : _selectedPage = HarmonyPage.splash,
        _isAuthenticated = authenticated;

  final List<HarmonyPage> _pageHistory = [];

  HarmonyPage _selectedPage;
  bool _isAuthenticated;
  String? channel = '';
  String? _serverId = '';

  HarmonyPage get selectedPage => _selectedPage;
  void set selectedPage(HarmonyPage page) {
    if (page == _selectedPage) return;
    _pageHistory.add(_selectedPage);
    _selectedPage = page;
    notifyListeners();
  }

  bool get isAuthenticated => _isAuthenticated;
  void set isAuthenticated(bool nextValue) {
    if (nextValue == _isAuthenticated) return;

    _isAuthenticated = nextValue;
    notifyListeners();
  }

  String? get serverId => _serverId;
  void set serverId(String? nextValue) {
    if (nextValue == null || nextValue == _serverId) return;

    _serverId = nextValue;
    notifyListeners();
  }

  HarmonyPage? get previousPage {
    if (_pageHistory.isEmpty) return null;
    return _pageHistory.last;
  }

  void goBack() {
    final previous = previousPage;

    if (previous != null) {
      _pageHistory.removeLast();
      _pageHistory.removeLast();
      selectedPage = previous;
    }
  }

  void pushPage(HarmonyPage page, String? nextServerId) {
    if (nextServerId != null) serverId = nextServerId;
    selectedPage = page;
  }
}
