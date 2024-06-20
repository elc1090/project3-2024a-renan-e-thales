import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  CustomText(this.text, {this.size, this.color, this.weight, super.key});

  String text;
  double? size;
  Color? color;
  FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 3,
      style: GoogleFonts.montserrat(
        fontWeight: weight ?? FontWeight.w600,
        fontSize: size ?? 20,
        color: color,
      ),
    );
  }
}
