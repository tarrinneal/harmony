/// Defines the model that encapsualtes a user in the auth context.

const _EMPTY_TOKEN = '';

class User {
  const User({
    required this.username,
    required this.email,
    this.token = _EMPTY_TOKEN,
    this.displayName = '',
  });

  final String username;
  final String email;
  final String token;
  final String displayName;

  User addToken(String token) {
    return User(username: username, email: email, token: token);
  }

  User addDisplayName(String displayName) {
    return User(
      username: username,
      email: email,
      token: token,
      displayName: displayName,
    );
  }

  bool get hasToken => token != _EMPTY_TOKEN;
}
