import 'package:flutter/material.dart';
import 'package:harmony/spec/spec.dart';

class WelcomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WelcomeAppBar({
    Key? key,
    required this.title,
    this.actions = const [],
  }) : super(key: key);

  final String title;
  final List<ActionButton> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizing.defaultLRMargin,
        vertical: Sizing.welcomeAppBarVerticalPadding,
      ),
      color: Theme.of(context).backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline6),
          Row(
            children: actions,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        Sizing.welcomeAppBarHeight + Sizing.welcomeAppBarVerticalPadding,
      );
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
