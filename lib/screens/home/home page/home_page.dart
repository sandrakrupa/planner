import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import "package:flutter/material.dart";
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:planner/widget/background_gradient.dart';

class HomePage extends StatefulWidget {
  HomePage({
    required this.user,
    required this.userName,
    super.key,
  });

  final User user;
  final String userName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 3;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const BackgroundGradientWidget(),
          Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                gradient: navyBlueGradient,
                boxShadow: [greyShadow],
              ),
              child: FlashyTabBar(
                showElevation: true,
                animationCurve: Curves.easeInOut,
                selectedIndex: _selectedIndex,
                backgroundColor: Colors.transparent,
                onItemSelected: (index) => setState(
                  () {
                    _selectedIndex = index;
                  },
                ),
                items: [
                  FlashyTabBarItem(
                    icon: const Icon(
                      Icons.task_alt_rounded,
                      color: Color.fromARGB(255, 252, 252, 253),
                    ),
                    title: Text('Tasks', style: textSMboldwhite),
                    activeColor: const Color.fromARGB(255, 17, 28, 108),
                  ),
                  FlashyTabBarItem(
                    icon: const Icon(
                      Icons.calendar_month_rounded,
                      color: Color.fromARGB(255, 252, 252, 253),
                    ),
                    title: Text('Calendar', style: textSMboldwhite),
                    activeColor: const Color.fromARGB(255, 17, 28, 108),
                  ),
                  FlashyTabBarItem(
                    icon: const Icon(
                      Icons.mood_rounded,
                      color: Color.fromARGB(255, 252, 252, 253),
                    ),
                    title: Text('Gratitude', style: textSMboldwhite),
                    activeColor: const Color.fromARGB(255, 17, 28, 108),
                  ),
                  FlashyTabBarItem(
                    icon: const Icon(
                      Icons.settings,
                      color: Color.fromARGB(255, 252, 252, 253),
                    ),
                    title: Text('Settings', style: textSMboldwhite),
                    activeColor: const Color.fromARGB(255, 17, 28, 108),
                  ),
                ],
              ),
            ),
            body: Container(),
          ),
        ],
      ),
    );
  }
}
