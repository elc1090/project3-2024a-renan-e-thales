import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(this.icon, {this.onPressed, this.filled = true, this.color, super.key});

  Icon icon;
  Color? color;
  void Function()? onPressed;
  bool filled;

  @override
  Widget build(BuildContext context) {
    return filled
        ? IconButton.filled(
            onPressed: onPressed,
            style: IconButton.styleFrom(backgroundColor: color ?? Colors.lightBlue[400]!),
            hoverColor: color != null ? color!.withAlpha(100) : Colors.lightBlue[700]!,
            icon: icon,
          )
        : IconButton(
            onPressed: onPressed,
            style: IconButton.styleFrom(
              iconSize: 20,
            ),
            visualDensity: VisualDensity.compact,
            icon: icon,
            color: Colors.grey[900],
          );
  }
}
