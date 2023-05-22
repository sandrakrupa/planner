import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:planner/widget/background_image_widget.dart';
import 'package:planner/widget/navy_blue_elevated_button_1_widget.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImageWidget(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      'Each day has 1440 minutes. It\'s up to you how you use them.',
                      style: displayXSbold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 450,
                ),
                NavyBlueElevatedButton1(
                  buttonText: 'Get Started',
                  buttonGradientColor: navyBlueGradient,
                  buttonTextStyle: textMDboldwhite,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
