import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:planner/screens/login%20and%20registration/registration_page.dart';
import 'package:planner/widget/background_image_widget.dart';
import 'package:planner/widget/input_widget.dart';
import 'package:planner/widget/navy_blue_elevated_button_1_widget.dart';
import 'package:planner/widget/text_button_widget.dart';
import 'package:planner/widget/text_over_input_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImageWidget(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
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
                  const InputWidget(
                    inputText: 'Enter your email',
                    inputIcon: Icons.email_rounded,
                    inputSuffixIcon: Icons.clear,
                    showInputSuffixIcon: false,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const TextOverInputWidget(
                    inputString: 'Password',
                  ),
                  const InputWidget(
                    inputText: '*******',
                    inputIcon: Icons.lock,
                    inputSuffixIcon: Icons.visibility,
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
                      Text('Don\'t have an account?',
                          style: textSMregularwhite),
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
        ),
      ],
    );
  }
}
