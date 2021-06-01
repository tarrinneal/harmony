import 'package:flutter/material.dart';
import '../models/user.dart';

class UserStatus extends StatelessWidget {
  const UserStatus({required this.user});

  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(user.user), Text(user.status ? 'Online' : 'Offline')],
      ),
    );
  }
}
