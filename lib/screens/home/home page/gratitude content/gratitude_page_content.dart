import 'package:flutter/material.dart';
import 'package:planner/widget/background_gradient.dart';

class GratitudePageContent extends StatelessWidget {
  const GratitudePageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundGradientWidget(),
        ListView(
          children: const [],
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
//               const MainText(
//                 mainText: 'Gratitude',
//               ),
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
