import 'package:flutter/material.dart';

class NavyBlueElevatedButton1 extends StatelessWidget {
  final String buttonText;
  final Gradient buttonGradientColor;
  final TextStyle buttonTextStyle;
  final VoidCallback onPressed;
  final double buttonWidth;
  final double buttonHeight;

  const NavyBlueElevatedButton1({
    Key? key,
    required this.buttonText,
    required this.buttonGradientColor,
    required this.buttonTextStyle,
    required this.onPressed,
    required this.buttonWidth,
    required this.buttonHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: buttonWidth,
          height: buttonHeight,
          margin: const EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
            gradient: buttonGradientColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 101, 101, 101).withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              disabledForegroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            onPressed: onPressed,
            child: Text(buttonText, style: buttonTextStyle),
          ),
        ),
      ],
    );
  }
}
