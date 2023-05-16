import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/widget/background_image_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
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
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  height: 200,
                  child: Center(
                    child: Text(
                      'Log into your account',
                      style: displayXSbold,
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ],
    );
  }
}
