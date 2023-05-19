import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:planner/core/padding_palette.dart';
import 'package:planner/widget/background_image_widget.dart';
import 'package:planner/widget/input_widget.dart';
import 'package:planner/widget/navy_blue_elevated_button_1_widget.dart';
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
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    height: 200,
                    child: Center(
                      child: Text(
                        'Log into your account',
                        style: displayXSbold,
                      ),
                    ),
                  ),
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
                const SizedBox(height: 8),
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
                    left: 20,
                    right: 20,
                  ),
                  alignment: Alignment.centerRight,
                  child: Text('Forgot Password?', style: textSMboldblue),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: NavyBlueElevatedButton1(
                    buttonText: 'Sign in',
                    buttonGradientColor: navyBlueGradient,
                    buttonwidth: double.infinity,
                    buttonpadding: buttonpadding1,
                    buttonTextStyle: textMDboldwhite,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
