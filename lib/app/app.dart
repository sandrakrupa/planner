import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner/app/cubit/auth_cubit.dart';
import 'package:planner/app/features/screens/login%20and%20registration/get_started_page.dart';

import 'features/screens/home/home page/user page/user_page.dart';
import 'features/screens/login and registration/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          const Color.fromARGB(255, 17, 28, 108).value,
          const <int, Color>{
            50: Color.fromARGB(255, 17, 28, 108),
            100: Color.fromARGB(255, 17, 28, 108),
            200: Color.fromARGB(255, 17, 28, 108),
            300: Color.fromARGB(255, 17, 28, 108),
            400: Color.fromARGB(255, 17, 28, 108),
            500: Color.fromARGB(255, 17, 28, 108),
            600: Color.fromARGB(255, 17, 28, 108),
            700: Color.fromARGB(255, 17, 28, 108),
            800: Color.fromARGB(255, 17, 28, 108),
            900: Color.fromARGB(255, 17, 28, 108),
          },
        ),
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthError) {
            return Scaffold(
              body: Center(child: Text('Error: ${state.errorMessage}')),
            );
          } else if (state is AuthUnauthenticated) {
            return LoginPage();
          } else if (state is AuthAuthenticated) {
            return UserPage(user: state.user);
          } else {
            return const GetStartedPage();
          }
        },
      ),
    );
  }
}
