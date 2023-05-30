import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:planner/firebase_options.dart';
import 'package:planner/screens/home/add%20task/add_task_page_content.dart';
import 'package:planner/screens/home/home%20page/home_page.dart';
import 'package:planner/screens/home/user/user%20page/user_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

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
      home: const UserPage(),
    );
  }
}
