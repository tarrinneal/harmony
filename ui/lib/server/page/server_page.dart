import 'package:flutter/material.dart';
import 'package:harmony/spec/spec.dart';
import '../widget/message.dart';
import '../widget/user.dart';
import 'dart:math';

typedef User = String;

class MessageData {
  const MessageData(
      {required this.user, required this.timestamp, required this.message});

  final User user;
  final DateTime timestamp;
  final String message;
}

class UserData {
  const UserData({
    required this.user,
    required this.status,
  });

  final User user;
  final bool status;
}

final messages = [
  for (var i = 1; i < 150; i++)
    MessageData(
      user: 'user $i',
      timestamp: DateTime.now(),
      message: 'This is a message, wow.',
    )
];

final users = [
  for (var i = 1; i < 150; i++)
    UserData(user: 'user $i', status: Random().nextInt(100) > 50)
];

class ServerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            child: Container(
              child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int i) {
                return Message(message: messages[i]);
              },
              ),
            ),
          ),
          Container(
            width: Sizing.homeSideBarWidth,
            child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int j) {
              return UserStatus(user: users[j]);
            },
            ),
          ),
        ],
      ),
    );
  }
}
