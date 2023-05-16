import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:planner/core/padding_palette.dart';
import 'package:planner/widget/background_image_widget.dart';
import 'package:planner/screens/login%20and%20registration/widgets/navy_blue_elevated_button_1_widget.dart';

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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 130,
                    child: Center(
                      child: Text(
                        'Each day has 1440 minutes. It\'s up to you how you use them.',
                        style: displayXSbold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: NavyBlueElevatedButton1(
                              buttonText: 'Get Started',
                              buttonGradientColor: navyBlueGradient,
                              buttonwidth: double.infinity,
                              buttonpadding: buttonpadding1,
                              buttonTextStyle: textMDboldwhite),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
