import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';

class InputWidget extends StatelessWidget {
  final String inputText;
  final IconData inputIcon;
  final IconData inputSuffixIcon;
  final bool showInputSuffixIcon;

  const InputWidget({
    Key? key,
    required this.inputText,
    required this.inputIcon,
    required this.inputSuffixIcon,
    this.showInputSuffixIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 101, 101, 101).withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: inputText,
            hintStyle: textMDregulargrey300,
            border: InputBorder.none,
            prefixIcon: Icon(inputIcon),
            suffixIcon: showInputSuffixIcon ? Icon(inputSuffixIcon) : null,
          ),
        ),
      ),
    );
  }
}
