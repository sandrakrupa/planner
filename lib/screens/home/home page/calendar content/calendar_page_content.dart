import 'dart:io';
import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:planner/widget/calendar_widget.dart';
import 'package:planner/widget/main_text_widget.dart';

class CalendarPageContent extends StatelessWidget {
  final ValueNotifier<File?> imageNotifier;
  const CalendarPageContent({
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
          mainText: 'Calendar',
        ),
        const SizedBox(
          height: 8,
        ),
        const CalendarWidget()
      ],
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:planner/core/fonts_palette.dart';
// import 'package:planner/core/gradient_palette.dart';
// import 'package:planner/widget/avatar_and_text_widget.dart';
// import 'package:planner/widget/background_gradient.dart';
// import 'package:planner/widget/main_text_widget.dart';
// import 'package:planner/widget/navy_blue_elevated_button_1_widget.dart';
// import 'package:table_calendar/table_calendar.dart';

// class CalendarPage extends StatefulWidget {
//   const CalendarPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<CalendarPage> createState() => _CalendarPageState();
// }

// class _CalendarPageState extends State<CalendarPage> {
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
//                     welcomeText: 'WELCOME, JUNGKOOK',
//                     imageURL: 'images/jungkookie.jpg',
//                     radius: 30),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     const MainText(
//                       mainText: 'Calendar',
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
//                 TableCalendar(
//                   focusedDay: DateTime.now(),
//                   firstDay: DateTime.utc(1990, 12, 4),
//                   lastDay: DateTime.utc(2113, 12, 31),
//                   calendarStyle: CalendarStyle(
//                       todayDecoration: const BoxDecoration(
//                         color: Color.fromARGB(255, 17, 28, 108),
//                         shape: BoxShape.circle,
//                       ),
//                       defaultTextStyle: textSMregulardate),
//                   headerStyle: const HeaderStyle(formatButtonVisible: false),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
