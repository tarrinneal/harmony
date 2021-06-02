import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    required this.label,
    this.iconData,
  });

  final String label;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(alignment: Alignment.centerLeft, padding: EdgeInsets.fromLTRB(25, 10, 0, 20)),
      icon: Icon(iconData ?? Icons.person_outline),
      onPressed: () => print('Button $label was pressed'),
      label: Text(label),
    );
  }
}