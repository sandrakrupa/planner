import 'package:flutter/material.dart';
import 'package:planner/app/features/core/fonts_palette.dart';
import 'package:planner/app/features/core/gradient_palette.dart';
import 'package:planner/app/features/screens/login%20and%20registration/cubit/cubit/login_cubit.dart';
import 'package:planner/app/features/widget/background_image_widget.dart';
import 'package:planner/app/features/widget/container_input_decoration_widget.dart';
import 'package:planner/app/features/widget/navy_blue_elevated_button_1_widget.dart';
import 'package:planner/app/features/widget/text_over_input_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImageWidget(),
        BlocProvider(
          create: (context) => LoginCubit(),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.errorMessage,
                          style: textMDboldwhite,
                        ),
                        backgroundColor: const Color.fromARGB(255, 148, 54, 54),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  final cubit = context.watch<LoginCubit>();

                  return ListView(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: Text(
                          cubit.isRegistration
                              ? 'Create an account'
                              : 'Log in to your account',
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
                            controller: emailController,
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
                            controller: passwordController,
                            obscureText: !cubit.isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: '*******',
                              hintStyle: textMDregulargrey300,
                              border: InputBorder.none,
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(cubit.isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off_rounded),
                                onPressed: cubit.togglePasswordVisibility,
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
                          state is LoginError ? state.errorMessage : '',
                          style: textSMboldred,
                        ),
                      ),
                      const SizedBox(
                        height: 110,
                      ),
                      NavyBlueElevatedButton1(
                        onPressed: () {
                          final cubit = context.read<LoginCubit>();
                          cubit.login(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            cubit.isRegistration,
                          );
                        },
                        buttonText: 'Sign in',
                        buttonGradientColor: navyBlueGradient,
                        buttonTextStyle: textMDboldwhite,
                        buttonHeight: 60,
                        buttonWidth: double.infinity,
                      ),
                      const SizedBox(height: 130),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?',
                              style: textSMregularwhite),
                          TextButton(
                            onPressed: cubit.toggleRegistrationMode,
                            child: Text(
                              cubit.isRegistration ? 'Log in' : 'Sign up',
                              style: textSMboldblue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
