import 'package:flutter/material.dart';
import '../widget/message.dart';

typedef User = String;

class MessageData {
  const MessageData({
    required this.user,
    required this.timestamp,
    required this.message
  });

  final User user;
  final DateTime timestamp;
  final String message;
}

final messages = [
  for (var i = 1; i < 150; i++)
    MessageData(user: 'user $i', timestamp: DateTime.now(), message: 'This is a message, wow.',)
];

class ServerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int i) {
            return Message(message: messages[i]);
          },
        ),
      ),
    );
  }
}
