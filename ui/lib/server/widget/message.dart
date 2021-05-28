import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({required this.message});

  final Map message;

  @override
  Widget build(BuildContext context) {
    var _list = message.values.toList();
    return ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int i) {
              return Container( child: Text(_list[i]));
            });
  }
}
