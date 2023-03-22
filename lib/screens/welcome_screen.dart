import 'package:quiz_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:quiz_app/components/rounded_btns.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/quiz.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Quiz App',
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                        ),
                        speed: Duration(milliseconds: 500)),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            WelcomeScreenBtns(
              colour: Colors.lightBlueAccent,
              label: 'Log In',
              onpress: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            WelcomeScreenBtns(
              label: 'Register',
              colour: Colors.blueAccent,
              onpress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
