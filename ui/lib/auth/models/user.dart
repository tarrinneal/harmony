/// Defines the model that encapsualtes a user in the auth context.
class User {
  const User({required this.username, required this.email});

  final String username;
  final String email;
}
