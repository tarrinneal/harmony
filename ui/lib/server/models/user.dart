typedef User = String;

class UserData {
  const UserData({
    required this.user,
    required this.status,
  });

  final User user;
  final bool status;
}