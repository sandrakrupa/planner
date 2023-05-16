import 'package:flutter/material.dart';
import 'package:planner/core/palette.dart';

class NavyBlueElevatedButton1 extends StatelessWidget {
  final String buttonText;

  const NavyBlueElevatedButton1({
    required this.buttonText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 8),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 17, 28, 108),
              Color.fromARGB(187, 113, 129, 254)
            ], begin: Alignment.center, end: Alignment.topCenter),
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
            child: const Padding(
              padding: EdgeInsets.only(
                left: 90,
                right: 90,
                top: 16,
                bottom: 16,
              ),
              child: Text('Get Started', style: textMDboldwhite),
            ),
          ),
        ),
      ],
    );
  }
}
