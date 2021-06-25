import 'dart:math';

import 'package:flutter/foundation.dart';

import 'auth_service.dart';
import '../models/auth_provider.dart';
import '../models/user.dart';

final rnd = Random();

@visibleForTesting
const fakePassword = 'fakepassword';
const _fakeGoogleProviderEmail = 'GoogleUser@gmail.com';

class _FakeUser extends User {
  _FakeUser({required String email})
      : super(email: email, username: _FakeUser.parseName(email));

  static String parseName(String email) {
    final idx = email.indexOf('@');

    return email.substring(0, idx);
  }
}

class FakeAuthService implements AuthService {
  bool _loggedIn = false;
  User? _user = null;

  @override
  Future<bool> login({
    AuthProvider provider = AuthProvider.email,
    String? email,
    String? password,
  }) async {
    if (_loggedIn) return _loggedIn;

    if (provider == AuthProvider.google) {
      await _fakeLatency;
      _user = _FakeUser(email: _fakeGoogleProviderEmail);
      _loggedIn = true;
      return true;
    }

    if (password == null || email == null) return false;

    if (password != fakePassword) return false;

    await _fakeLatency;
    _user = _FakeUser(email: email);

    _loggedIn = true;

    return _loggedIn;
  }

  // Wait between half a second and a second to simulate latency.
  Future<void> get _fakeLatency =>
      Future.delayed(Duration(milliseconds: rnd.nextInt(500) + 500));

  @override
  Future<bool> logout() async {
    _user = null;
    _loggedIn = false;
    return true;
  }

  @override
  Future<bool> register({
    required String email,
    required String password,
  }) async {
    if (password != fakePassword) return false;
    _user = _FakeUser(email: email);
    _loggedIn = true;
    return _loggedIn;
  }

  @override
  Future<User?> get user async => _user;

  @override
  Future<bool> get loggedIn async => _loggedIn;
}
