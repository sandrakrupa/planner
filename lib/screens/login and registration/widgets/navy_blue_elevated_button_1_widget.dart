import 'package:flutter/material.dart';

class NavyBlueElevatedButton1 extends StatelessWidget {
  final String buttonText;
  final Gradient buttonGradientColor;
  final double buttonwidth;
  final EdgeInsetsGeometry buttonpadding;
  final TextStyle buttonTextStyle;

  const NavyBlueElevatedButton1(
      {Key? key,
      required this.buttonText,
      required this.buttonGradientColor,
      required this.buttonwidth,
      required this.buttonpadding,
      required this.buttonTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 4),
          width: buttonwidth,
          decoration: BoxDecoration(
            gradient: buttonGradientColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
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
            onPressed: () {},
            child: Padding(
              padding: buttonpadding,
              child: Text(buttonText, style: buttonTextStyle),
            ),
          ),
        ),
      ],
    );
  }
}
