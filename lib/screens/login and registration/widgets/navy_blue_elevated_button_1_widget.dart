import 'package:flutter/material.dart';
import 'package:planner/core/palette.dart';

class NavyBlueElevatedButton1 extends StatelessWidget {
  final String buttonText;
  final Gradient buttonGradientColor;

  const NavyBlueElevatedButton1(
      {Key? key, required this.buttonText, required this.buttonGradientColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 8),
          width: double.infinity,
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
              padding: const EdgeInsets.only(
                left: 90,
                right: 90,
                top: 16,
                bottom: 16,
              ),
              child: Text(buttonText, style: textMDboldwhite),
            ),
          ),
        ),
      ],
    );
  }
}
