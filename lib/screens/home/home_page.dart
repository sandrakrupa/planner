import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/widget/avatar_and_text_widget.dart';
import 'package:planner/widget/background_image_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
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
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const AvatarAndText(
                  welcomeText: 'WELCOME, JUNGKOOK',
                  imageURL: 'images/jungkookie.jpg',
                  radius: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Schedule', style: displayXSbold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
