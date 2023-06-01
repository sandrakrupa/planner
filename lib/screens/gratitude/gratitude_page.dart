import 'package:flutter/material.dart';
import 'package:planner/screens/gratitude/timeline/timeline_widget.dart';
import 'package:planner/widget/avatar_and_text_widget.dart';
import 'package:planner/widget/background_gradient.dart';
import 'package:planner/widget/main_text_widget.dart';

class GratitudePage extends StatelessWidget {
  const GratitudePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundGradientWidget(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              const AvatarAndText(
                  welcomeText: 'WELCOME, JUNGKOOK',
                  imageURL: 'images/jungkookie.jpg',
                  radius: 30),
              const SizedBox(
                height: 16,
              ),
              const MainText(
                mainText: 'Gratitude',
              ),
              const SizedBox(
                height: 15,
              ),
              TimelineWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
