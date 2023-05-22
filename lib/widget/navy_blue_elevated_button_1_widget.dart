import 'package:flutter/material.dart';

class NavyBlueElevatedButton1 extends StatelessWidget {
  final String buttonText;
  final Gradient buttonGradientColor;
  final TextStyle buttonTextStyle;

  const NavyBlueElevatedButton1(
      {Key? key,
      required this.buttonText,
      required this.buttonGradientColor,
      required this.buttonTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(4.0),
          margin: const EdgeInsets.all(16),
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
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 70.0,
              ),
              child: Text(buttonText, style: buttonTextStyle),
            ),
          ),
        ),
      ],
    );
  }
}
