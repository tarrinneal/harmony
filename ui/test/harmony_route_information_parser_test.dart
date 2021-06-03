import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:harmony/routing/config/harmony_route_information_parser.dart';
import 'package:harmony/routing/config/harmony_route_path.dart';

void main() {
  group(HarmonyRouteInformationParser, () {
    group('.parseRouteInformation', () {
      test('returns SplashRoute for empty pathSegments', () async {
        // Arrange
        final routeInfo = RouteInformation(location: '/');

        // Act
        final routePath = await _infoParser.parseRouteInformation(routeInfo);

        // Assert
        expect(routePath, isA<SplashRoutePath>());
      });

      test('returns SplashRoute for null location', () async {
        // Arrange
        final routeInfo = RouteInformation();

        // Act
        final routePath = await _infoParser.parseRouteInformation(routeInfo);

        // Assert
        expect(routePath, isA<SplashRoutePath>());
      });

      test(
          'returns WelcomeRoute for location with 1 segment and containing '
          'welcome', () async {
        // Arrange
        final routeInfo = RouteInformation(location: '/welcome');

        // Act
        final routePath = await _infoParser.parseRouteInformation(routeInfo);

        // Assert
        expect(routePath, isA<WelcomeRotuePath>());
      });

      test(
          'returns UnknownRoute for location with 2 segments and containing '
          'welcome', () async {
        // Arrange
        final routeInfo = RouteInformation(location: '/welcome/2');

        // Act
        final routePath = await _infoParser.parseRouteInformation(routeInfo);

        // Assert
        expect(routePath, isA<UnknownRoutePath>());
      });

      test('returns AppShellRoute for location containing server', () async {
        // Arrange
        final expectedServerId = 'asdfaskdlfa';
        final routeInfo = RouteInformation(
          location: '/server/$expectedServerId',
        );

        // Act
        final routePath = await _infoParser.parseRouteInformation(routeInfo);

        // Assert
        expect(routePath, isA<AppShellRoutePath>());
        final serverId = (routePath as AppShellRoutePath).serverId;
        expect(serverId, expectedServerId);
      });

      test(
          'returns AppShellRoute for location containing server with \'home\''
          'serverId when none provided in location', () async {
        // Arrange
        final routeInfo = RouteInformation(location: '/server');

        // Act
        final routePath = await _infoParser.parseRouteInformation(routeInfo);

        // Assert
        expect(routePath, isA<AppShellRoutePath>());
        final serverId = (routePath as AppShellRoutePath).serverId;
        expect(serverId, 'home');
      });

      test('returns UnkownRoute for an unknown location', () async {
        // Arrange
        final routeInfo = RouteInformation(location: '/asdfajk;sdfa/asdjfiap');

        // Act
        final routePath = await _infoParser.parseRouteInformation(routeInfo);

        // Assert
        expect(routePath, isA<UnknownRoutePath>());
      });
    });

    group('.restoreRouteInformation', () {
      test('returns information with /woops location for UnknownRoute', () {
        // Arrange/Act
        final routeInfo = _infoParser.restoreRouteInformation(
          UnknownRoutePath(),
        );

        // Assert
        expect(routeInfo, isNotNull);
        expect(routeInfo!.location, '/woops');
      });

      test(
          'returns information with /welcome location for WelcomeRoute and '
          'SplashRoute', () {
        // Arrange/Act
        final splashRouteInfo = _infoParser.restoreRouteInformation(
          SplashRoutePath(),
        );
        final welcomeRouteInfo = _infoParser.restoreRouteInformation(
          SplashRoutePath(),
        );

        // Assert
        expect(splashRouteInfo, isNotNull);
        expect(splashRouteInfo!.location, '/welcome');
        expect(welcomeRouteInfo, isNotNull);
        expect(welcomeRouteInfo!.location, '/welcome');
      });

      test('returns information with /server location for AppShellRoutePath',
          () {
        // Arrange
        final serverId = 'asdfasdf';
        // Act
        final homeRouteInfo = _infoParser.restoreRouteInformation(
          AppShellRoutePath('home'),
        );
        final serverRouteInfo = _infoParser.restoreRouteInformation(
          AppShellRoutePath(serverId),
        );

        // Assert
        expect(homeRouteInfo, isNotNull);
        expect(homeRouteInfo!.location, '/server/home');
        expect(serverRouteInfo, isNotNull);
        expect(serverRouteInfo!.location, '/server/$serverId');
      });
    });
  });
}

// Create an instance for the file since there is no internal state kept,
// there's no need to reset it for each test.
final _infoParser = HarmonyRouteInformationParser();
