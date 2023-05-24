import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';

class AvatarAndText extends StatelessWidget {
  final String welcomeText;
  final String imageURL;
  final double radius;

  const AvatarAndText({
    Key? key,
    required this.welcomeText,
    required this.imageURL,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            welcomeText,
            style: textMDregulargrey700,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 101, 101, 101).withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(imageURL),
              radius: radius,
            ),
          ),
        )
      ],
    );
  }
}
