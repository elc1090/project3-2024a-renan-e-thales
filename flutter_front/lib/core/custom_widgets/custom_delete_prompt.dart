import 'package:flutter/material.dart';
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
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width > 450 ? 450 : MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                widget.title != null ? widget.title! : "Deletar?",
                size: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: CustomText(
                      "cancelar",
                      size: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  TextButton(
                    onPressed: widget.onPressed,
                    child: CustomText(
                      "deletar",
                      size: 14,
                      color: Colors.red[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
