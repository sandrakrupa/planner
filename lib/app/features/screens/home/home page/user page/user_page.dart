import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planner/app/cubit/auth_cubit.dart';
import 'package:planner/app/core/fonts_palette.dart';
import 'package:planner/app/core/gradient_palette.dart';
import 'package:planner/app/features/screens/home/home%20page/gratitude%20content/gratitude_page_content.dart';
import 'package:planner/app/features/screens/home/home%20page/task%20content/task_page_content.dart';
import 'package:planner/app/features/screens/home/home%20page/user%20page/add%20name/add_name_page.dart';
import 'package:planner/app/features/screens/home/home%20page/user%20page/cubit/cubit/image_cubit.dart';
import 'package:planner/app/features/screens/home/home%20page/user%20page/cubit/cubit/user_cubit.dart';
import 'package:planner/app/features/widget/background_gradient.dart';
import 'package:planner/app/features/widget/container_input_decoration_widget.dart';
import 'package:planner/app/features/widget/main_text_widget.dart';
import 'package:planner/app/features/widget/navy_blue_elevated_button_1_widget.dart';
import 'package:planner/app/features/widget/text_over_input_widget.dart';
import 'package:planner/app/models/name_model.dart';
import 'package:planner/app/repositories/names_repository.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UserPage extends StatefulWidget {
  const UserPage({
    super.key,
    required this.user,
  });
  final User user;
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const BackgroundGradientWidget(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Builder(
              builder: (context) {
                if (_selectedIndex == 0) {
                  return const TaskPageContent();
                }
                if (_selectedIndex == 1) {
                  return const GratitudePageContent();
                }
                return BlocProvider(
                  create: (context) => UserCubit(NamesRepository())..start(),
                  child: BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      final nameModel = state.names;

                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            for (final nameModel in nameModel)
                              _UserPageBody(
                                nameModel: nameModel,
                                email: widget.user.email,
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            bottomNavigationBar: FlashyTabBar(
              showElevation: true,
              animationCurve: Curves.bounceIn,
              selectedIndex: _selectedIndex,
              backgroundColor: const Color.fromARGB(255, 238, 246, 253),
              iconSize: 30,
              onItemSelected: (index) => setState(
                () {
                  _selectedIndex = index;
                },
              ),
              items: [
                FlashyTabBarItem(
                  icon: const Icon(
                    Icons.task_alt_rounded,
                    color: Color.fromARGB(255, 17, 28, 108),
                  ),
                  title: Text('Task', style: textSMboldblue),
                  activeColor: const Color.fromARGB(255, 17, 28, 108),
                ),
                FlashyTabBarItem(
                  icon: const Icon(
                    Icons.mood_rounded,
                    color: Color.fromARGB(255, 17, 28, 108),
                  ),
                  title: Text('Gratitude', style: textSMboldblue),
                  activeColor: const Color.fromARGB(255, 17, 28, 108),
                ),
                FlashyTabBarItem(
                  icon: const Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 17, 28, 108),
                  ),
                  title: Text('Your Profile', style: textSMboldblue),
                  activeColor: const Color.fromARGB(255, 17, 28, 108),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UserPageBody extends StatelessWidget {
  const _UserPageBody({
    required this.email,
    required this.nameModel,
    Key? key,
  }) : super(key: key);
  final String? email;

  final NameModel nameModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              nameModel.title,
              style: textMDregulargrey700,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const MainText(
            mainText: 'Your Profile',
          ),
          const SizedBox(
            height: 40,
          ),
          const TextOverInputWidget(
            inputString: 'Name',
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddNamePage(),
                ),
              );
            },
            child: ContainerInputDecorationWidget(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle: textMDregulargrey300,
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const TextOverInputWidget(
            inputString: 'Email',
          ),
          ContainerInputDecorationWidget(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: '$email',
                  hintStyle: textMDregulargrey300,
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.email),
                  suffixIcon: const Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 170,
          ),
          NavyBlueElevatedButton1(
            onPressed: () {
              context.read<AuthCubit>().logout();
            },
            buttonText: 'Log out',
            buttonGradientColor: navyBlueGradient,
            buttonTextStyle: textMDboldwhite,
            buttonHeight: 60,
            buttonWidth: double.infinity,
          ),
        ],
      ),
    );
  }
}
