import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_front/core/custom_widgets/custom_icon_button.dart';
import 'package:flutter_front/core/custom_widgets/custom_text.dart';

class CustomDeletePrompt extends StatefulWidget {
  CustomDeletePrompt(this.title, {this.subtitle, this.onPressed, super.key});

  String? title;
  String? subtitle;
  void Function()? onPressed;

  @override
  State<CustomDeletePrompt> createState() => _CustomDeletePromptState();
}

class _CustomDeletePromptState extends State<CustomDeletePrompt> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        height: 100,
        width: MediaQuery.of(context).size.width > 400 ? 400 : MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                CustomText(
                  widget.title != null ? widget.title! : "Deletar?",
                  size: 18,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: CustomText(
                    "cancelar",
                    size: 12,
                    color: Colors.grey[600],
                  ),
                ),
                TextButton(
                  onPressed: widget.onPressed,
                  child: CustomText(
                    "deletar",
                    size: 12,
                    color: Colors.red[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
