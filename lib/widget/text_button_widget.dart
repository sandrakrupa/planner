import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String textButtonWidget;
  final TextStyle buttonTextStyleWidget;

  const TextButtonWidget(
      {Key? key,
      required this.textButtonWidget,
      required this.buttonTextStyleWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        textButtonWidget,
        style: buttonTextStyleWidget,
      ),
    );
  }
}
