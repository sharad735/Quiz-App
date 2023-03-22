import 'package:flutter/material.dart';
import 'package:quiz_app/components/rounded_btns.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

class QuizStartScreen extends StatefulWidget {
  static const String id = 'quiz_start_screen';

  const QuizStartScreen({super.key});

  @override
  State<QuizStartScreen> createState() => _QuizStartScreenState();
}

class _QuizStartScreenState extends State<QuizStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/quiz.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            
            
            WelcomeScreenBtns(
              label: 'Start Quiz',
              colour: Colors.lightBlueAccent,
              onpress: () {
                Navigator.pushNamed(context, QuizzerApp.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
