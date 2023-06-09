import 'dart:io';
import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:planner/widget/main_text_widget.dart';

class GratitudePageContent extends StatelessWidget {
  final ValueNotifier<File?> imageNotifier;
  const GratitudePageContent({
    required this.imageNotifier,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                'WELCOME, ',
                style: textMDregulargrey700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ValueListenableBuilder<File?>(
                valueListenable: imageNotifier,
                builder: (context, selectedImage, _) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: navyBlueGradient,
                      shape: BoxShape.circle,
                      boxShadow: [
                        greyShadow,
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 30,
                      child: selectedImage != null
                          ? ClipOval(
                              child: Image.file(
                                selectedImage,
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              ),
                            )
                          : const Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.white,
                            ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const MainText(
          mainText: 'Gratitude',
        ),
      ],
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:planner/screens/home/home%20page/gratitude%20content/timeline/timeline_widget.dart';
// import 'package:planner/widget/avatar_and_text_widget.dart';
// import 'package:planner/widget/background_gradient.dart';
// import 'package:planner/widget/main_text_widget.dart';

// class GratitudePage extends StatelessWidget {
//   const GratitudePage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         const BackgroundGradientWidget(),
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           body: ListView(
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               const AvatarAndText(
//                   welcomeText: 'WELCOME, JUNGKOOK',
//                   imageURL: 'images/jungkookie.jpg',
//                   radius: 30),
//               const SizedBox(
//                 height: 16,
//               ),
              // const MainText(
              //   mainText: 'Gratitude',
              // ),
//               const SizedBox(
//                 height: 15,
//               ),
//               TimelineWidget(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
