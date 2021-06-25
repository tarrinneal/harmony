import 'package:flutter_test/flutter_test.dart';
import 'package:harmony/auth/auth.dart';

void main() {
  group(AuthService, () {
    group('.fake', () {
      group('login', () {
        test('returns true if already logged in', () async {
          // Arrange
          final service = AuthServiceFactory.fake();
          expect(await service.login(provider: AuthProvider.google), true);

          // Act
          final result = await service.login();

          // Assert
          expect(result, true);
        });

        test('returns true for AuthProvider.google', () async {
          // Arrange
          final service = AuthServiceFactory.fake();

          // Act
          final result = await service.login(provider: AuthProvider.google);

          // Assert
          expect(result, true);
        });

        test('returns false when password empty', () async {
          // Arrange
          final service = AuthServiceFactory.fake();

          // Act
          final result = await service.login(
            email: 'sadfjk;as@gmail.com',
            password: null,
          );

          // Assert
          expect(result, false);
        });

        test('returns false when email empty', () async {
          // Arrange
          final service = AuthServiceFactory.fake();

          // Act
          final result = await service.login(
            email: null,
            password: 'fakePassword',
          );

          // Assert
          expect(result, false);
        });

        test('returns false when password incorrect', () async {
          // Arrange
          final service = AuthServiceFactory.fake();

          // Act
          final result = await service.login(
            email: 'sadfjk;as@gmail.com',
            password: 'incorrect_password',
          );

          // Assert
          expect(result, false);
        });

        test('returns true when password is correct', () async {
          // Arrange
          final service = AuthServiceFactory.fake();

          // Act
          final result = await service.login(
            email: 'sadfjk;as@gmail.com',
            password: fakePassword,
          );

          // Assert
          expect(result, true);
        });

        test('sets user when succesfully logged in', () async {
          // Arrange
          final domain = 'fake-domain';
          final email = '$domain@gmail.com';
          final service = AuthServiceFactory.fake();

          // Act
          await service.login(
            email: email,
            password: fakePassword,
          );

          final user = await service.user;

          // Assert
          expect(await service.loggedIn, true);
          expect(user!, isNotNull);

          expect(user.email, email);
          expect(user.username, domain);
        });
      });

      group('.register', () {
        test('returns false when password doesn\'t match', () async {
          // Arrange
          final service = AuthServiceFactory.fake();
          // Act
          final result = await service.register(
            email: 'email',
            password: 'incorrect_password',
            displayName: 'Bobby',
          );
          // Assert
          expect(result, false);
        });

        test('returns true when sucesfully registered', () async {
          // Arrange
          final service = AuthServiceFactory.fake();
          // Act
          final result = await service.register(
            email: 'email@example.com',
            password: fakePassword,
            displayName: 'Bobby',
          );
          // Assert
          expect(result, true);
        });

        test('sets user when succesfully registered', () async {
          // Arrange
          final domain = 'fake-domain';
          final email = '$domain@gmail.com';
          final service = AuthServiceFactory.fake();

          // Act
          await service.register(
            email: email,
            password: fakePassword,
            displayName: 'Bobby',
          );

          final user = await service.user;

          // Assert
          expect(await service.loggedIn, true);
          expect(user!, isNotNull);

          expect(user.email, email);
          expect(user.username, domain);
        });
      });

      group('.logout', () {
        test('returns true when succesfully logged out', () async {
          // Arrange
          final domain = 'fake-domain';
          final email = '$domain@gmail.com';
          final service = AuthServiceFactory.fake();

          await service.login(
            email: email,
            password: fakePassword,
          );

          final user = await service.user;

          expect(await service.loggedIn, true);
          expect(user!, isNotNull);

          // Act
          final result = await service.logout();

          // Assert
          expect(await service.user, isNull);
          expect(await service.loggedIn, false);
          expect(result, true);
        });
      });
    });
  });
}
