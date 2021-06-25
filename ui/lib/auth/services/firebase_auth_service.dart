import 'package:firebase_auth/firebase_auth.dart' as fb;

import 'auth_service.dart';
import '../models/auth_provider.dart';
import '../models/user.dart';

class FirebaseAuthService implements AuthService {
  FirebaseAuthService(this._auth);
  final fb.FirebaseAuth _auth;
  User? _user;
  @override
  // TODO: implement loggedIn
  Future<bool> get loggedIn async => _auth.currentUser != null;

  @override
  Future<bool> login({
    AuthProvider provider = AuthProvider.email,
    String? email,
    String? password,
  }) async {
    switch (provider) {
      case AuthProvider.google:
        return _handleGoogleLogin();
      case AuthProvider.email:
        if (email == null || password == null) return false;
        return _handleEmailLogin(email, password);
    }
  }

  Future<bool> _handleEmailLogin(String email, String password) async {
    fb.UserCredential credential;
    try {
      credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on fb.FirebaseAuthException catch (e) {
      print('Error logging in with email');
      print('Email: ${e.email}');
      return false;
    }

    _user = User(
      username: credential.user?.displayName ?? '',
      email: credential.user?.email ?? '',
    );
    return true;
  }

  Future<bool> _handleGoogleLogin() async {
    // _auth.signInWithPopup(GoogleAuthProvider());
    return true;
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<bool> register({
    required String email,
    required String password,
    required String displayName,
  }) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  Future<User?> get user => throw UnimplementedError();
}
