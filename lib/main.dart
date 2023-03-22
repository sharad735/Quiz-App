import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_app/firebase_options.dart';
import 'package:quiz_app/screens/quiz_start_screen.dart';
import 'package:quiz_app/screens/welcome_screen.dart';
import 'package:quiz_app/screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/quiz_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        QuizzerApp.id: (context) => QuizzerApp(),
        QuizStartScreen.id: (context)=>QuizStartScreen()
      },
    );
  }
}
