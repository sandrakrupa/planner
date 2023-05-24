import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'WELCOME, JUNGKOOK',
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
                              color: const Color.fromARGB(255, 101, 101, 101)
                                  .withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('images/jungkookie.jpg'),
                          radius: 50,
                        ),
                      ),
                    )
                  ],
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
