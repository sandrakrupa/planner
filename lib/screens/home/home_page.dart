import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:planner/widget/avatar_and_text_widget.dart';
import 'package:planner/widget/background_gradient.dart';
import 'package:planner/widget/main_text_widget.dart';
import 'package:planner/widget/navy_blue_elevated_button_1_widget.dart';
import 'package:planner/widget/task_widget.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundGradientWidget(),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                    NavyBlueElevatedButton1(
                        buttonText: 'Add Task',
                        buttonGradientColor: navyBlueGradient,
                        buttonTextStyle: textXSboldwhite,
                        onPressed: () {},
                        buttonWidth: 150,
                        buttonHeight: 30),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: const Color.fromARGB(255, 17, 28, 108),
                    dayTextStyle: textXSnormaldate,
                    dateTextStyle: textXLbolddate,
                    monthTextStyle: textXSnormaldate,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TaskWidget(),
                const TaskWidget(),
                const TaskWidget(),
                const TaskWidget(),
                const TaskWidget(),
                const TaskWidget(),
                const TaskWidget(),
                const TaskWidget(),
                const TaskWidget(),
                const TaskWidget(),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 17, 28, 108),
                  Color.fromARGB(187, 113, 129, 254),
                ],
                begin: Alignment.center,
                end: Alignment.topCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 101, 101, 101).withOpacity(0.3),
                  spreadRadius: 7,
                  blurRadius: 9,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: FlashyTabBar(
              backgroundColor: Colors.transparent,
              onItemSelected: (int value) {},
              items: [
                FlashyTabBarItem(
                  icon: const Icon(Icons.event),
                  title: Text('Events', style: textSMboldwhite),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.search),
                  title: const Text('Search'),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.highlight),
                  title: const Text('Highlights'),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.settings),
                  title: const Text('Settings'),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.settings),
                  title: const Text('한국어'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
