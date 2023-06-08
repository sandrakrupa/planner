import 'package:flutter/material.dart';
import 'package:planner/widget/background_gradient.dart';

class SettingsPageContent extends StatelessWidget {
  const SettingsPageContent({
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
// import 'package:planner/core/fonts_palette.dart';
// import 'package:planner/core/gradient_palette.dart';
// import 'package:planner/widget/avatar_and_text_widget.dart';
// import 'package:planner/widget/background_gradient.dart';
// import 'package:planner/widget/input_widget.dart';
// import 'package:planner/widget/main_text_widget.dart';
// import 'package:planner/widget/navy_blue_elevated_button_1_widget.dart';
// import 'package:planner/widget/text_over_input_widget.dart';

// class UserPage extends StatelessWidget {
//   const UserPage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         const BackgroundGradientWidget(),
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           body: SafeArea(
//             child: ListView(
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const AvatarAndText(
//                   welcomeText: 'WELCOME, JUNGKOOK',
//                   imageURL: 'images/jungkookie.jpg',
//                   radius: 30,
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 const MainText(
//                   mainText: 'Your Account',
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 const TextOverInputWidget(
//                   inputString: 'Name',
//                 ),
//                 const InputWidget(
//                   inputText: 'Jungkook',
//                   inputIcon: Icons.person,
//                   inputSuffixIcon: Icons.arrow_right_rounded,
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 const TextOverInputWidget(
//                   inputString: 'Password',
//                 ),
//                 const InputWidget(
//                   inputText: '*******',
//                   inputIcon: Icons.lock,
//                   inputSuffixIcon: Icons.arrow_right_rounded,
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 const TextOverInputWidget(inputString: 'Email'),
//                 const InputWidget(
//                   inputText: 'jungkook@gmail.com',
//                   inputIcon: Icons.email,
//                   inputSuffixIcon: Icons.arrow_right_rounded,
//                 ),
//                 const SizedBox(
//                   height: 120,
//                 ),
//                 NavyBlueElevatedButton1(
//                   onPressed: () {},
//                   buttonText: 'Log out',
//                   buttonGradientColor: navyBlueGradient,
//                   buttonTextStyle: textMDboldwhite,
//                   buttonHeight: 60,
//                   buttonWidth: double.infinity,
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 NavyBlueElevatedButton1(
//                   onPressed: () {},
//                   buttonText: 'Delete account ',
//                   buttonGradientColor: redGradient,
//                   buttonTextStyle: textMDboldwhite,
//                   buttonHeight: 60,
//                   buttonWidth: double.infinity,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
