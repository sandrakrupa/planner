import 'dart:io';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import "package:flutter/material.dart";
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:planner/widget/background_gradient.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  final String userName;
  const HomePage({
    required this.userName,
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? imageFile;

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
      });
    }
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
            body: ListView(
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
                        'WELCOME, ${widget.userName}',
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
                                  content: Text(
                                    'Select a photo from:',
                                    style: textMDregulargrey700,
                                  ),
                                  actions: [
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
                                    )
                                  ],
                                );
                              });
                        },
                        child: Container(
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
                            child: imageFile != null
                                ? ClipOval(
                                    child: Image.file(
                                      imageFile!,
                                      fit: BoxFit.cover,
                                      width: 30,
                                      height: 30,
                                    ),
                                  )
                                : const Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
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
          ),
        ],
      ),
    );
  }
}
