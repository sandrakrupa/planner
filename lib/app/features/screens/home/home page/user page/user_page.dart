import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planner/app/cubit/auth_cubit.dart';
import 'package:planner/app/features/core/fonts_palette.dart';
import 'package:planner/app/features/core/gradient_palette.dart';
import 'package:planner/app/features/screens/home/home%20page/calendar%20content/calendar_page_content.dart';
import 'package:planner/app/features/screens/home/home%20page/gratitude%20content/gratitude_page_content.dart';
import 'package:planner/app/features/widget/background_gradient.dart';
import 'package:planner/app/features/widget/container_input_decoration_widget.dart';
import 'package:planner/app/features/widget/main_text_widget.dart';
import 'package:planner/app/features/widget/navy_blue_elevated_button_1_widget.dart';
import 'package:planner/app/features/widget/text_over_input_widget.dart';

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
  String userName = '';
  TextEditingController nameController = TextEditingController();

  File? imageFile;

  ValueNotifier<File?> imageNotifier = ValueNotifier<File?>(null);

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
        imageNotifier.value = imageFile;
      });
    }
  }

  void deleteImage() {
    setState(() {
      imageFile = null;
      imageNotifier.value = null;
    });
  }

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
            body: Builder(
              builder: (context) {
                if (_selectedIndex == 0) {
                  return CalendarPageContent(
                    imageNotifier: imageNotifier,
                  );
                }
                if (_selectedIndex == 1) {
                  return GratitudePageContent(
                    imageNotifier: imageNotifier,
                    userName: userName,
                  );
                }
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
                            'WELCOME, $userName',
                            style: textMDregulargrey700,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Change Photo',
                                      style: displayXSbold,
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Select a photo from:',
                                          style: textMDregulargrey700,
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Wrap(
                                          spacing: 13,
                                          runSpacing: 13,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                pickImage(ImageSource.gallery);
                                              },
                                              child: Text(
                                                'Gallery',
                                                style: textSMboldblue,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                pickImage(ImageSource.camera);
                                              },
                                              child: Text(
                                                'Camera',
                                                style: textSMboldblue,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                deleteImage();
                                              },
                                              child: Text(
                                                'Delete',
                                                style: textSMboldred,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: navyBlueGradient,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  greyShadow,
                                ],
                              ),
                              child: ValueListenableBuilder<File?>(
                                valueListenable: imageNotifier,
                                builder: (BuildContext context, File? value,
                                    Widget? child) {
                                  return CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 30,
                                    child: imageFile != null
                                        ? ClipOval(
                                            child: Image.file(
                                              imageFile!,
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
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
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
                    ContainerInputDecorationWidget(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your name',
                            hintStyle: textMDregulargrey300,
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.person),
                          ),
                          onSubmitted: (value) {
                            setState(() {
                              userName = value;
                            });
                          },
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
                              hintText: '${widget.user.email}',
                              hintStyle: textMDregulargrey300,
                              border: InputBorder.none,
                              prefixIcon: const Icon(Icons.email),
                              suffixIcon: const Icon(Icons.lock)),
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
                );
              },
            ),
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
                    title: Text('Task', style: textSMboldwhite),
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
                      Icons.person,
                      color: Color.fromARGB(255, 252, 252, 253),
                    ),
                    title: Text('Your Profile', style: textSMboldwhite),
                    activeColor: const Color.fromARGB(255, 17, 28, 108),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
