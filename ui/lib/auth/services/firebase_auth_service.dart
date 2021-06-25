import 'package:firebase_auth/firebase_auth.dart' as fb;

import 'auth_service.dart';
import '../models/auth_provider.dart';
import '../models/user.dart';

class FirebaseAuthService implements AuthService {
  const FirebaseAuthService(this._auth);
  final fb.FirebaseAuth _auth;
  @override
  // TODO: implement loggedIn
  Future<bool> get loggedIn => throw UnimplementedError();

  @override
  Future<bool> login({
    AuthProvider provider = AuthProvider.email,
    String? email,
    String? password,
  }) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<bool> register({required String email, required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  Future<User?> get user => throw UnimplementedError();
}
