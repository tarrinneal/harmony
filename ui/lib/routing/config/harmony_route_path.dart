abstract class HarmonyRoutePath {
  const HarmonyRoutePath();
}

class SplashRoutePath extends HarmonyRoutePath {}

class WelcomeRotuePath extends HarmonyRoutePath {}

class LoginRoutePath extends HarmonyRoutePath {}

class AppShellRoutePath extends HarmonyRoutePath {
  const AppShellRoutePath(this.serverId);
  final String serverId;
}

class UnknownRoutePath extends HarmonyRoutePath {}
