import 'package:firebase_auth/firebase_auth.dart';
import 'package:harmony/auth/services/fake_auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:harmony/auth/services/firebase_auth_service.dart';

import 'auth_service.dart';

class AuthServiceFactory {
  static AuthService firebase(FirebaseAuth auth, {GoogleSignIn? googleSignIn}) {
    return FirebaseAuthService(
      auth,
      googleSignIn: googleSignIn,
    );
  }

  static AuthService fake() => FakeAuthService();
}
