import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(this.icon, {this.onPressed, this.filled = true, super.key});

  Icon icon;
  void Function()? onPressed;
  bool filled;

  @override
  Widget build(BuildContext context) {
    return filled
        ? IconButton.filled(
            onPressed: onPressed,
            hoverColor: Theme.of(context).colorScheme.primaryContainer.withAlpha(50),
            icon: icon,
          )
        : IconButton(
            onPressed: onPressed,
            hoverColor: Theme.of(context).colorScheme.primaryContainer.withAlpha(50),
            icon: icon,
          );
  }
}
