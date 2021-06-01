import 'dart:math';
import 'package:flutter/material.dart';
import 'package:harmony/spec/spec.dart';

import '../models/message.dart';
import '../models/user.dart';
import '../widget/message.dart';
import '../widget/user.dart';

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
    UserData(
      user: 'user $i',
      status: Random().nextInt(100) > 50,
    )
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
