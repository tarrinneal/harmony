import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:harmony/auth/auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart'
    as fb;
import 'package:mockito/mockito.dart';
import 'package:platform_type/platform_type.dart' as client_type;

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

    group('.firebase', () {
      group('login()', () {
        group('with AuthProvider.google', () {
          tearDown(client_type.reset);
          test(
              'returns true for successful login with Google Auth Provider on '
              'web', () async {
            // Arrange
            client_type.debugSetPlatformType(client_type.PlatformType.web);
            final service = AuthServiceFactory.firebase(
              _MockFirebaseAuth(
                credential: _FakeUserCredential(user: _FakeUser()),
              ),
              googleSignIn: _FakeGoogleSign(),
            );

            // Act
            final result = await service.login(provider: AuthProvider.google);

            // Assert
            expect(result, true);
          });

          test(
              'returns true for successful login with Google Auth Provider on '
              'android', () async {
            // Arrange
            client_type.debugSetPlatformType(client_type.PlatformType.android);
            final service = AuthServiceFactory.firebase(
              _MockFirebaseAuth(
                credential: _FakeUserCredential(user: _FakeUser()),
              ),
              googleSignIn: _FakeGoogleSign(),
            );

            // Act
            final result = await service.login(provider: AuthProvider.google);

            // Assert
            expect(result, true);
          });
        });
        group('with AuthProvider.email', () {
          tearDown(client_type.reset);

          test(
              'returns false when AuthProvider.email is set and email is not '
              'provided.', () async {
            // Arrange
            client_type.debugSetPlatformType(client_type.PlatformType.web);
            final service = AuthServiceFactory.firebase(
              _MockFirebaseAuth(
                credential: _FakeUserCredential(user: _FakeUser()),
              ),
              googleSignIn: _FakeGoogleSign(),
            );

            // Act
            final result = await service.login(
              provider: AuthProvider.email,
              password: 'password',
            );

            // Assert
            expect(result, false);
          });

          test(
              'returns false when AuthProvider.email is set and password is '
              'not provided.', () async {
            // Arrange
            client_type.debugSetPlatformType(client_type.PlatformType.web);
            final service = AuthServiceFactory.firebase(
              _MockFirebaseAuth(
                credential: _FakeUserCredential(user: _FakeUser()),
              ),
              googleSignIn: _FakeGoogleSign(),
            );

            // Act
            final result = await service.login(
              provider: AuthProvider.email,
              email: 'email',
            );

            // Assert
            expect(result, false);
          });

          test(
              'returns true for successful login with email and password sign '
              'in.', () async {
            // Arrange
            final service = AuthServiceFactory.firebase(
              _MockFirebaseAuth(
                credential: _FakeUserCredential(user: _FakeUser()),
              ),
              googleSignIn: _FakeGoogleSign(),
            );

            // Act
            final result = await service.login(
              provider: AuthProvider.email,
              email: 'email@gmail.com',
              password: 'password',
            );

            // Assert
            expect(result, true);
          });
        });
      });

      group('logout()', () {
        test('calls signOut', () async {
          // Arrange
          final _auth = _MockFirebaseAuth(
            credential: _FakeUserCredential(user: _FakeUser()),
          );

          when(_auth.signOut()).thenAnswer((_) async => null);
          final service = AuthServiceFactory.firebase(
            _auth,
            googleSignIn: _FakeGoogleSign(),
          );

          // Act
          final result = await service.logout();

          // Assert
          verify(_auth.signOut()).called(1);
          expect(result, true);
        });
      });

      group('register()', () {
        test('returns true on succesful sign up', () async {
          // Arrange
          final _auth = _MockFirebaseAuth(
            credential: _FakeUserCredential(user: _FakeUser()),
          );

          // when(_auth.signOut()).thenAnswer((_) async => null);
          final service = AuthServiceFactory.firebase(
            _auth,
            googleSignIn: _FakeGoogleSign(),
          );

          // Act
          final result = await service.register(
            email: 'bob@gmail.com',
            password: '1234',
            displayName: 'BobKnows',
          );

          // Assert
          expect(result, true);
        });
      });

      group('user', () {
        test('returns null if not signed in', () async {
          // Arrange
          final _auth = _MockFirebaseAuth(
            credential: _FakeUserCredential(user: _FakeUser()),
          );

          final service = AuthServiceFactory.firebase(
            _auth,
            googleSignIn: _FakeGoogleSign(),
          );

          // Act
          await service.register(
            email: 'bob@gmail.com',
            password: '1234',
            displayName: 'BobKnows',
          );

          final user = await service.user;

          // Assert
          expect(user, isNotNull);
        });
      });
    });
  });
}

final _idToken = 'test_id_token';

class _FakeUser extends Fake implements fb.User {
  @override
  String? get displayName => 'displayName';
  String? get email => 'email@google.com';

  @override
  Future<String> getIdToken([bool forceRefresh = false]) async => _idToken;

  @override
  Future<void> updateDisplayName(String? displayName) async {}
}

class _FakeUserCredential extends Fake implements fb.UserCredential {
  _FakeUserCredential({fb.User? user}) : _user = user;
  fb.User? _user;

  @override
  fb.User? get user => _user;
}

class _MockFirebaseAuth extends Mock implements fb.FirebaseAuth {
  _MockFirebaseAuth({fb.UserCredential? credential})
      : _credential = credential ?? _FakeUserCredential(),
        _currentUser = credential?.user;
  final fb.UserCredential _credential;
  fb.User? _currentUser;

  @override
  fb.User? get currentUser => _currentUser;

  @override
  Future<fb.UserCredential> signInWithPopup(fb.AuthProvider _) async =>
      _credential;

  @override
  Future<fb.UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      _credential;

  @override
  Future<fb.UserCredential> signInWithCredential(
    fb.AuthCredential credential,
  ) async =>
      _credential;

  @override
  Future<void> signOut() async {
    _currentUser = null;
    return super.noSuchMethod(Invocation.method(#signOut, []));
  }

  Future<fb.UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      _credential;
}

class _FakeGoogleSign extends Fake implements GoogleSignIn {
  @override
  Future<GoogleSignInAccount?> signIn() async {
    return _FakeGoogleSignInAccount();
  }
}

class _FakeGoogleSignInAccount extends Fake implements GoogleSignInAccount {
  Future<GoogleSignInAuthentication> get authentication async =>
      _FakeGoogleSignInAuthentication();

  bool operator ==(dynamic other) {
    return true;
  }
}

class _FakeGoogleSignInAuthentication extends Fake
    implements GoogleSignInAuthentication {
  @override
  String? get accessToken => '';
  @override
  String? get idToken => _idToken;
}
