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
            style: IconButton.styleFrom(backgroundColor: Colors.lightBlue[400]!),
            hoverColor: Colors.lightBlue[700]!,
            icon: icon,
          )
        : IconButton(
            onPressed: onPressed,
            style: IconButton.styleFrom(backgroundColor: Colors.lightBlue[400]!),
            hoverColor: Colors.lightBlue[700]!,
            icon: icon,
          );
  }
}
