import 'package:flutter/material.dart';
import '../widget/message.dart';

final messages = [
  for (var i = 1; i < 15; i++)
    {
      'user': 'user $i',
      'timestamp': DateTime.now().toString(),
      'message': 'This is a message, wow.'
    }
];

class ServerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int i) {
              return Container(
                //needs to be dynamically sized
                  height: 100,
                  width: 1000,
                  child: Message(message: messages[i]));
            }))
      );
  }
}
