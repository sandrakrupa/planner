import 'package:flutter/material.dart';
import 'package:planner/app/core/fonts_palette.dart';

class MainText extends StatelessWidget {
  final String mainText;

  const MainText({
    Key? key,
    required this.mainText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Text(mainText, style: displayXSbold));
  }
}
