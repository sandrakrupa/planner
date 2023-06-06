import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:planner/screens/login%20and%20registration/registration_page.dart';
import 'package:planner/widget/background_image_widget.dart';
import 'package:planner/widget/container_input_decoration_widget.dart';
import 'package:planner/widget/navy_blue_elevated_button_1_widget.dart';
import 'package:planner/widget/text_button_widget.dart';
import 'package:planner/widget/text_over_input_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImageWidget(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: ListView(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: Text(
                    'Log into your account',
                    style: displayXSbold,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const TextOverInputWidget(
                  inputString: 'Email Address',
                ),
                ContainerInputDecorationWidget(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      controller: widget.emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: textMDregulargrey300,
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.email_rounded),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const TextOverInputWidget(
                  inputString: 'Password',
                ),
                ContainerInputDecorationWidget(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      controller: widget.passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: '*******',
                        hintStyle: textMDregulargrey300,
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off_rounded),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  margin: const EdgeInsets.only(
                    right: 16,
                  ),
                  alignment: Alignment.centerRight,
                  child: TextButtonWidget(
                    onPressed: () {},
                    buttonTextStyleWidget: textSMboldblue,
                    textButtonWidget: 'Forgot Password?',
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                NavyBlueElevatedButton1(
                  onPressed: () {},
                  buttonText: 'Sign in',
                  buttonGradientColor: navyBlueGradient,
                  buttonTextStyle: textMDboldwhite,
                  buttonHeight: 60,
                  buttonWidth: double.infinity,
                ),
                const SizedBox(
                  height: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?', style: textSMregularwhite),
                    TextButtonWidget(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationPage(),
                            ),
                          );
                        },
                        textButtonWidget: 'Sign up',
                        buttonTextStyleWidget: textSMboldblue)
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
