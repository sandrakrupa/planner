import 'package:flutter/material.dart';
import 'package:planner/core/palette.dart';
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
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
                  height: 550,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      SizedBox(
                        width: 300,
                        child: NavyBlueElevatedButton1(),
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

