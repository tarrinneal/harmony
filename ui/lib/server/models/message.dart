import 'user.dart';

class MessageData {
  const MessageData({
    required this.user,
    required this.timestamp,
    required this.message,
  });

  final User user;
  final DateTime timestamp;
  final String message;
}
