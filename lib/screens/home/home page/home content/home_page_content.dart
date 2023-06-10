import 'dart:io';
import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:planner/widget/main_text_widget.dart';

class HomePageContent extends StatelessWidget {
  final ValueNotifier<File?> imageNotifier;
  const HomePageContent({
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
          mainText: 'Schedule',
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}





// import 'package:date_picker_timeline/date_picker_widget.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:planner/core/fonts_palette.dart';
// import 'package:planner/core/gradient_palette.dart';
// import 'package:planner/widget/avatar_and_text_widget.dart';
// import 'package:planner/widget/background_gradient.dart';
// import 'package:planner/widget/main_text_widget.dart';
// import 'package:planner/widget/navy_blue_elevated_button_1_widget.dart';
// import 'package:planner/widget/task_widget.dart';

// class CheckPage extends StatelessWidget {
//   const CheckPage({
//     required this.user,
//     super.key,
//   });

//   final User user;

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
//                 AvatarAndText(
//                   welcomeText: 'WELCOME, ${user.displayName}',
//                   imageURL: 'images/jungkookie.jpg',
//                   radius: 30,
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const MainText(
//                           mainText: 'Schedule',
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Container(
//                           margin: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                           ),
//                           child: Text(
//                             DateFormat.yMMMMd().format(
//                               DateTime.now(),
//                             ),
//                             style: textMDregulargrey500,
//                           ),
//                         ),
//                       ],
//                     ),
//                     NavyBlueElevatedButton1(
//                         buttonText: 'Add Task',
//                         buttonGradientColor: navyBlueGradient,
//                         buttonTextStyle: textXSboldwhite,
//                         onPressed: () {},
//                         buttonWidth: 150,
//                         buttonHeight: 30),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(right: 16, left: 16),
//                   child: DatePicker(
//                     DateTime.now(),
//                     initialSelectedDate: DateTime.now(),
//                     selectionColor: const Color.fromARGB(255, 17, 28, 108),
//                     dayTextStyle: textXSnormaldate,
//                     dateTextStyle: textXLbolddate,
//                     monthTextStyle: textXSnormaldate,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const TaskWidget(),
//                 const TaskWidget(),
//                 const TaskWidget(),
//                 const TaskWidget(),
//                 const TaskWidget(),
//                 const TaskWidget(),
//                 const TaskWidget(),
//                 const TaskWidget(),
//                 const TaskWidget(),
//                 const TaskWidget(),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
