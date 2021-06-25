import '../models/user.dart';
import '../models/auth_provider.dart';

/// [AuthService] defines the api for an object that handles the application
/// user's authentication.
abstract class AuthService {
  Future<bool> login({
    AuthProvider provider,
    String? email,
    String? password,
  });
  Future<bool> register({
    required String email,
    required String password,
    required String displayName,
  });
  Future<bool> logout();
  Future<User?> get user;
  Future<bool> get loggedIn;
}
