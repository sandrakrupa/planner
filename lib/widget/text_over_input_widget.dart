import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';

class TextOverInputWidget extends StatelessWidget {
  final String inputString;
  const TextOverInputWidget({Key? key, required this.inputString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        inputString,
        style: textSMboldgrey500,
      ),
    );
  }
}
