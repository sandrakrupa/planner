import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import "package:flutter/material.dart";
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:planner/screens/home/home%20page/calendar%20content/calendar_page_content.dart';
import 'package:planner/screens/home/home%20page/gratitude%20content/gratitude_page_content.dart';
import 'package:planner/widget/background_gradient.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planner/widget/main_text_widget.dart';
import 'package:planner/widget/navy_blue_elevated_button_1_widget.dart';

class SettingsPage extends StatefulWidget {
  final String userName;
  const SettingsPage({
    required this.userName,
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                  return CalendarPageContent(imageNotifier: imageNotifier);
                }
                if (_selectedIndex == 1) {
                  return GratitudePageContent(imageNotifier: imageNotifier);
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
                      mainText: 'Settings',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    NavyBlueElevatedButton1(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
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
