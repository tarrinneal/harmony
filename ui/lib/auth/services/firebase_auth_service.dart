import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:platform_type/platform_type.dart' as client_type;

import 'auth_service.dart';
import '../models/auth_provider.dart';
import '../models/user.dart';

class FirebaseAuthService implements AuthService {
  FirebaseAuthService(
    this._auth, {
    GoogleSignIn? googleSignIn,
  }) : _googleSignIn = googleSignIn ?? GoogleSignIn();

  final fb.FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  User? _user;
  @override
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
    if (!_credentialHasUser(credential)) return false;
    await _setUser(credential);
    return true;
  }

  Future<void> _setUser(fb.UserCredential credential) async {
    _user = User(
      username: credential.user!.displayName ?? '',
      email: credential.user!.email ?? '',
      token: await credential.user!.getIdToken(),
    );
  }

  Future<bool> _handleGoogleLogin() async {
    return client_type.ClientType.platform.isWeb
        ? _loginWithGoogleWeb()
        : _loginWithGoogleMobile();
  }

  Future<bool> _loginWithGoogleWeb() async {
    // Create a new provider
    fb.GoogleAuthProvider googleProvider = fb.GoogleAuthProvider();

    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    fb.UserCredential credential;
    try {
      // Once signed in, return the UserCredential
      credential = await _auth.signInWithPopup(googleProvider);
    } on fb.FirebaseAuthException catch (e) {
      print('Error logging Google Provider on web.');
      print('Error Message: ${e.message}');
      return false;
    }

    if (!_credentialHasUser(credential)) return false;
    await _setUser(credential);

    return true;
  }

  Future<bool> _loginWithGoogleMobile() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) return false;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final oAuthCredential = fb.GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    fb.UserCredential credential;
    try {
      credential = await _auth.signInWithCredential(oAuthCredential);
    } on fb.FirebaseAuthException catch (e) {
      print('Error registering user.');
      print('Error Code: ${e.code}');
      print('Error Message: ${e.message}');
      return false;
    }

    if (!_credentialHasUser(credential)) return false;
    return true;
  }

  @override
  Future<bool> logout() async {
    await _auth.signOut();
    return await loggedIn ? false : true;
  }

  @override
  Future<bool> register({
    required String email,
    required String password,
    required String displayName,
  }) async {
    fb.UserCredential credential;
    try {
      credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on fb.FirebaseAuthException catch (e) {
      print('Error registering user.');
      print('Error Code: ${e.code}');
      print('Error Message: ${e.message}');
      return false;
    }

    if (!_credentialHasUser(credential)) return false;

    await credential.user!.updateDisplayName(displayName);

    await _setUser(credential);

    _user = _user!.addDisplayName(displayName);

    return true;
  }

  bool _credentialHasUser(fb.UserCredential credential) =>
      credential.user != null;

  @override
  Future<User?> get user async => _user;
}

extension on client_type.PlatformType {
  bool get isWeb => this == client_type.PlatformType.web;
}
