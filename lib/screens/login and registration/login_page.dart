import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';
import 'package:planner/core/gradient_palette.dart';
import 'package:planner/screens/home/home%20page/home_page.dart';
import 'package:planner/widget/background_image_widget.dart';
import 'package:planner/widget/container_input_decoration_widget.dart';
import 'package:planner/widget/navy_blue_elevated_button_1_widget.dart';
import 'package:planner/widget/text_over_input_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  bool _isRegistration = false;

  String errorMessage = '';
  String getErrorMessage(
    FirebaseAuthException exception,
    String email,
    String password,
  ) {
    switch (exception.code) {
      case 'invalid-email':
        return 'Invalid email adress.';
      case 'user-disabled':
        return 'Your account has been disabled.';
      case 'user-not-found':
        return 'User not found.';
      case 'wrong-password':
        return 'Invalid password.';
      case 'weak-password':
        return 'Password should be at least 7 characters long.';
      default:
        if (email.isEmpty || password.isEmpty) {
          return 'Email and password cannot be empty.';
        } else {
          return 'An error occurred. Please try again.';
        }
    }
  }


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
                    _isRegistration
                        ? 'Create an account'
                        : 'Log into your account',
                    style: displayXSbold,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                if (_isRegistration)
                  const TextOverInputWidget(inputString: 'Name'),
                if (_isRegistration)
                  ValueListenableBuilder(
                    valueListenable: widget.usernameController,
                    builder: (context, value, _) {
                      return ContainerInputDecorationWidget(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextField(
                            controller: widget.usernameController,
                            decoration: InputDecoration(
                              hintText: 'Enter your name',
                              hintStyle: textMDregulargrey300,
                              border: InputBorder.none,
                              prefixIcon: const Icon(Icons.person),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                if (_isRegistration)
                  const SizedBox(
                    height: 8,
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
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  errorMessage,
                  style: textSMboldred,
                )),
                SizedBox(
                  height: _isRegistration ? 70 : 70,
                ),
                NavyBlueElevatedButton1(
                  onPressed: () async {
                    if (_isRegistration) {
                      //registration
                      if (widget.passwordController.text.trim().length < 7) {
                        setState(() {
                          errorMessage =
                              'Password should be at least 7 characters long.';
                        });
                      } else {
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: widget.emailController.text.trim(),
                            password: widget.passwordController.text.trim(),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                user: FirebaseAuth.instance.currentUser!,
                                userName: widget.usernameController.text.trim(),
                              ),
                            ),
                          );
                        } on FirebaseAuthException catch (e) {
                          setState(() {
                            errorMessage = getErrorMessage(
                              e,
                              widget.emailController.text.trim(),
                              widget.passwordController.text.trim(),
                            );
                          });
                        } catch (e) {
                          setState(() {
                            errorMessage =
                                'An error occurred. Please try again.';
                          });
                        }
                      }
                    } else {
                      //logging
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: widget.emailController.text.trim(),
                          password: widget.passwordController.text.trim(),
                        );
                      } on FirebaseAuthException catch (e) {
                        setState(
                          () {
                            errorMessage = getErrorMessage(
                              e,
                              widget.emailController.text.trim(),
                              widget.passwordController.text.trim(),
                            );
                          },
                        );
                      } catch (e) {
                        setState(() {
                          errorMessage = 'An error occurred. Please try again.';
                        });
                      }
                    }
                  },
                  buttonText: 'Sign in',
                  buttonGradientColor: navyBlueGradient,
                  buttonTextStyle: textMDboldwhite,
                  buttonHeight: 60,
                  buttonWidth: double.infinity,
                ),
                SizedBox(
                  height: _isRegistration ? 80 : 180,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?', style: textSMregularwhite),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isRegistration = !_isRegistration;
                        });
                      },
                      child: Text(
                        _isRegistration ? 'Log in' : 'Sign up',
                        style: textSMboldblue,
                      ),
                    ),
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
