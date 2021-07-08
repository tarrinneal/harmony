abstract class HarmonyRoutePath {
  const HarmonyRoutePath();
}

class SplashRoutePath extends HarmonyRoutePath {}

class WelcomeRoutePath extends HarmonyRoutePath {}

class AppShellRoutePath extends HarmonyRoutePath {
  const AppShellRoutePath(this.serverId);
  final String serverId;
}

class UnknownRoutePath extends HarmonyRoutePath {}

class LoginRoutePath extends HarmonyRoutePath {}

class RegisterRoutePath extends HarmonyRoutePath {}
