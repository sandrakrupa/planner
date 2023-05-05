import 'package:flutter/material.dart';
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
          body: ListView(
            children: const [
              Text(''),
            ],
          ),
        ),
      ],
    );
  }
}
