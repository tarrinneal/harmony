import '../models/user.dart';
import '../models/auth_provider.dart';

abstract class AuthService {
  factory AuthService.standard() => _DefaultAuthService();
  Future<bool> login({
    required AuthProvider provider,
    String email,
    String password,
  });
  Future<bool> register({
    required String email,
    required String password,
  });
  Future<bool> logout();
  Future<User> get user;
}

/// Default implementation of [AuthService] that provides default
/// implementations for auth providers.
class _DefaultAuthService implements AuthService {
  @override
  Future<bool> login({
    AuthProvider provider = AuthProvider.email,
    String? email,
    String? password,
  }) async {
    // TODO: implement login
    throw UnimplementedError();
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
  }) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  Future<User> get user => throw UnimplementedError();
}


