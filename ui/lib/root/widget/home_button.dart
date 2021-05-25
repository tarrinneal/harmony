import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    required this.label,
    this.iconData,
    this.focused: false,
  });

  final String label;
  final IconData? iconData;
  final bool focused;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(iconData ?? Icons.person_outline),
      onPressed: () => print('Button $label was pressed'),
      label: Text(label),
      style: TextButton.styleFrom(backgroundColor: focused ? Theme.of(context).backgroundColor : Theme.of(context).primaryColorLight),
    );
  }
}
