import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:harmony/routing/config/harmony_route_path.dart';

/// HarmonyRouteInformation Parser parses and restores path information the
/// application.
///
/// RouteMap:
/// '/' =>
/// should display a splash page
///
/// '/welcome' =>
/// should display a page where the user learns about the app and has a way to
/// authenticate.
///
/// '/server/$serverId/?$cchannelId' =>
///  should display a server page, this route can optionally contain a channelId
///  to display a selected channel within the server
class HarmonyRouteInformationParser
    extends RouteInformationParser<HarmonyRoutePath> {
  @override
  Future<HarmonyRoutePath> parseRouteInformation(
    RouteInformation routeInformation,
  ) {
    final segments = Uri.parse(routeInformation.location ?? '/').pathSegments;
    if (segments.isEmpty) return SynchronousFuture(SplashRoutePath());

    // TODO(): Attempt user Authentication at this junction.
    if (segments.length == 1 && segments.first == 'welcome') {
      return SynchronousFuture(WelcomeRotuePath());
    }

    if (segments.contains('server')) {
      final serverId = segments.length > 1 ? segments.elementAt(1) : '/home';
      return SynchronousFuture(AppShellRoutePath(serverId));
    }

    return Future.value(UnknownRoutePath());
  }

  @override
  RouteInformation? restoreRouteInformation(HarmonyRoutePath configuration) {
    if (configuration is UnknownRoutePath)
      return RouteInformation(location: '404');

    if (configuration is WelcomeRotuePath || configuration is SplashRoutePath) {
      return RouteInformation(location: '/welcome');
    }

    if (configuration is AppShellRoutePath) {
      return RouteInformation(location: '/server/${configuration.serverId}');
    }
  }
}
