/// Defines the model that encapsualtes a user in the auth context.

const _EMPTY_TOKEN = '';

class User {
  const User({
    required this.username,
    required this.email,
    this.token = _EMPTY_TOKEN,
  });

  final String username;
  final String email;
  final String token;

  User addToken(String token) {
    return User(username: username, email: email, token: token);
  }

  bool get hasToken => token != _EMPTY_TOKEN;
}
