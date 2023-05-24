import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/widget/avatar_and_text_widget.dart';
import 'package:planner/widget/background_image_widget.dart';
import 'package:planner/widget/main_text_widget.dart';

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
                  radius: 30,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MainText(
                          mainText: 'Schedule',
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: Text(
                            DateFormat.yMMMMd().format(
                              DateTime.now(),
                            ),
                            style: textMDregulargrey500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
