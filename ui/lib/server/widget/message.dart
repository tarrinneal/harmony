import 'package:flutter/material.dart';
import '../models/message.dart';

class Message extends StatelessWidget {
  const Message({required this.message});

  final MessageData message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(message.user),
              SizedBox(width: 15),
              Text(message.timestamp.toString())
            ],
          ),
          Text(message.message),
        ],
      ),
    );
  }
}
