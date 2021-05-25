import 'package:flutter/material.dart';

class ServerButton extends StatelessWidget {
  const ServerButton({
    required this.focused,
    required this.label,
    required this.onPressed,
    this.iconData,
  });

  final String label;
  final IconData? iconData;
  final bool focused;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(iconData ?? Icons.person_outline),
      onPressed: () => onPressed(label),
      label: Text(label),
      style: TextButton.styleFrom(
        backgroundColor: focused
            ? Theme.of(context).backgroundColor
            : Theme.of(context).primaryColorLight,
      ),
    );
  }
}
