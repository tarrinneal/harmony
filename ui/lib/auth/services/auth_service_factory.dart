import 'package:firebase_auth/firebase_auth.dart';
import 'package:harmony/auth/services/fake_auth_service.dart';
import 'package:harmony/auth/services/firebase_auth_service.dart';

import 'auth_service.dart';

class AuthServiceFactory {
  static AuthService firebase(FirebaseAuth auth) {
    return FirebaseAuthService(auth);
  }

  static AuthService fake() => FakeAuthService();
}
