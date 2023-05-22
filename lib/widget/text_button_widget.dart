import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String textButtonWidget;
  final TextStyle buttonTextStyleWidget;
  final VoidCallback onPressed;

  const TextButtonWidget(
      {Key? key,
      required this.textButtonWidget,
      required this.buttonTextStyleWidget,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        textButtonWidget,
        style: buttonTextStyleWidget,
      ),
    );
  }
}
