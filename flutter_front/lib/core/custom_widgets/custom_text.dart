import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  CustomText(this.text, {this.size, this.color, super.key});

  String text;
  double? size;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w600,
        fontSize: size ?? 20,
        color: color,
      ),
    );
  }
}
