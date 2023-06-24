import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner/app/cubit/auth_cubit.dart';
import 'package:planner/app/core/fonts_palette.dart';
import 'package:planner/app/core/gradient_palette.dart';
import 'package:planner/app/features/screens/home/home%20page/gratitude%20content/gratitude_page_content.dart';
import 'package:planner/app/features/screens/home/home%20page/task%20content/task_page_content.dart';
import 'package:planner/app/features/screens/home/home%20page/user%20page/add%20name/add_name_page.dart';
import 'package:planner/app/features/screens/home/home%20page/user%20page/add%20name/cubit/add_name_cubit.dart';
import 'package:planner/app/features/screens/home/home%20page/user%20page/cubit/cubit/user_cubit.dart';
import 'package:planner/app/features/widget/background_gradient.dart';
import 'package:planner/app/features/widget/container_input_decoration_widget.dart';
import 'package:planner/app/features/widget/main_text_widget.dart';
import 'package:planner/app/features/widget/navy_blue_elevated_button_1_widget.dart';
import 'package:planner/app/features/widget/text_over_input_widget.dart';
import 'package:planner/app/models/name_model.dart';
import 'package:planner/app/repositories/names_repository.dart';

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
                                onNameChanged: (name) {
                                  context.read<UserCubit>().remove(
                                        documentID: name,
                                      );
                                },
                                // onNameEditingComplete: (name) {
                                //   context.read<UserCubit>().update(
                                //         documentID: name,
                                //         title: name,
                                //       );
                                // },
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
    required this.onNameChanged,
    // required this.onNameEditingComplete,
    required this.nameModel,
    Key? key,
  }) : super(key: key);
  final String? email;
  final Function(String) onNameChanged;
  // final Function(String) onNameEditingComplete;
  final NameModel nameModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                  nameModel.title,
                  style: textMDregulargrey700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: navyBlueGradient,
                    shape: BoxShape.circle,
                    boxShadow: [
                      greyShadow,
                    ],
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 30,
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
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
                  onChanged: onNameChanged,
                  // onEditingComplete: () => onNameEditingComplete(nameModel.title),
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

// Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: InkWell(
//                             onTap: () {
//                               showDialog(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return AlertDialog(
//                                     title: Text(
//                                       'Change Photo',
//                                       style: displayXSbold,
//                                     ),
//                                     content: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Select a photo from:',
//                                           style: textMDregulargrey700,
//                                         ),
//                                         const SizedBox(
//                                           height: 30,
//                                         ),
//                                         Wrap(
//                                           spacing: 13,
//                                           runSpacing: 13,
//                                           children: [
//                                             TextButton(
//                                               onPressed: () {
//                                                 Navigator.of(context).pop();
//                                                 pickImage(ImageSource.gallery);
//                                               },
//                                               child: Text(
//                                                 'Gallery',
//                                                 style: textSMboldblue,
//                                               ),
//                                             ),
//                                             TextButton(
//                                               onPressed: () {
//                                                 Navigator.of(context).pop();
//                                                 pickImage(ImageSource.camera);
//                                               },
//                                               child: Text(
//                                                 'Camera',
//                                                 style: textSMboldblue,
//                                               ),
//                                             ),
//                                             TextButton(
//                                               onPressed: () {
//                                                 Navigator.of(context).pop();
//                                                 deleteImage();
//                                               },
//                                               child: Text(
//                                                 'Delete',
//                                                 style: textSMboldred,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 },
//                               );
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 gradient: navyBlueGradient,
//                                 shape: BoxShape.circle,
//                                 boxShadow: [
//                                   greyShadow,
//                                 ],
//                               ),
//                               child: ValueListenableBuilder<File?>(
//                                 valueListenable: imageNotifier,
//                                 builder: (BuildContext context, File? value,
//                                     Widget? child) {
//                                   return CircleAvatar(
//                                     backgroundColor: Colors.transparent,
//                                     radius: 30,
//                                     child: imageFile != null
//                                         ? ClipOval(
//                                             child: Image.file(
//                                               imageFile!,
//                                               fit: BoxFit.cover,
//                                               width: 60,
//                                               height: 60,
//                                             ),
//                                           )
//                                         : const Icon(
//                                             Icons.add,
//                                             size: 30,
//                                             color: Colors.white,
//                                           ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),






  // String userName = '';
  // TextEditingController nameController = TextEditingController();

  // File? imageFile;

  // ValueNotifier<File?> imageNotifier = ValueNotifier<File?>(null);

  // Future<void> pickImage(ImageSource source) async {
  //   final pickedImage = await ImagePicker().pickImage(source: source);
  //   if (pickedImage != null) {
  //     setState(() {
  //       imageFile = File(pickedImage.path);
  //       imageNotifier.value = imageFile;
  //     });
  //   }
  // }

  // void deleteImage() {
  //   setState(() {
  //     imageFile = null;
  //     imageNotifier.value = null;
  //   });
  // }

  //   @override
  // void initState() {
  //   super.initState();
  // }