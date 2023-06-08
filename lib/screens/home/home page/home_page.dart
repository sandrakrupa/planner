import "package:flutter/material.dart";
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:planner/screens/calendar/calendar_page.dart';
import 'package:planner/widget/background_gradient.dart';

class HomePage extends StatelessWidget {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: PersistentTabView(
          context,
          screens: _buildScreens(),
          controller: _controller,
          items: _navBarItems(),
          confineInSafeArea: true,
          backgroundColor: const Color.fromARGB(255, 17, 28, 108),
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            boxShadow: [greyShadow],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            colorBehindNavBar: const Color.fromARGB(255, 17, 28, 108),
          ),
          popAllScreensOnTapOfSelectedTab: true,
          itemAnimationProperties: const ItemAnimationProperties(
            curve: Curves.decelerate,
          ),
        ),
      ),
    );
  }
}

List<PersistentBottomNavBarItem> _navBarItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.task_alt_rounded),
      title: "Check",
      activeColorPrimary: const Color.fromARGB(255, 252, 252, 253),
      textStyle: textSMboldwhite,
      inactiveColorPrimary: const Color.fromARGB(255, 252, 252, 253),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.calendar_today),
      title: "Calendar",
      activeColorPrimary: const Color.fromARGB(255, 252, 252, 253),
      textStyle: textSMboldwhite,
      inactiveColorPrimary: const Color.fromARGB(255, 252, 252, 253),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.mood),
      title: "Gratitude",
      activeColorPrimary: const Color.fromARGB(255, 252, 252, 253),
      textStyle: textSMboldwhite,
      inactiveColorPrimary: const Color.fromARGB(255, 252, 252, 253),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.settings),
      title: "Settings",
      activeColorPrimary: const Color.fromARGB(255, 252, 252, 253),
      textStyle: textSMboldwhite,
      inactiveColorPrimary: const Color.fromARGB(255, 252, 252, 253),
    ),
  ];
}

List<Widget> _buildScreens() {
  // Define your screens here
  return [
    // Screen 1
    Stack(
      children: [
        const BackgroundGradientWidget(),
        ListView(
          children: const [],
        ),
      ],
    ),
    // Screen 2
    const CalendarPage(),
    // Screen 3
    Container(color: Colors.green),
    // Screen 4
    Container(color: Colors.yellow),
  ];
}
