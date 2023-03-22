import 'package:flutter/material.dart';
import 'package:quiz_app/components/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

int last_score = 0;

class QuizzerApp extends StatelessWidget {
  static const String id = 'quiz_screen';

  const QuizzerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: quizzerBtns(),
          ),
        ),
      ),
    );
  }
}

class quizzerBtns extends StatefulWidget {
  const quizzerBtns({super.key});

  @override
  State<quizzerBtns> createState() => _quizzerBtnsState();
}

class _quizzerBtnsState extends State<quizzerBtns> {
  List<Icon> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain();
  void checkAnswer(bool userAnswer) {
    bool userAnswer = quizBrain.getQuestionAnswers();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
                context: context,
                title: "FINISHED",
                desc:
                    "You Have finished the questions!. Your Score is $last_score")
            .show();
        quizBrain.reset();
        scoreKeeper = [];
      } else {
        if (userAnswer == true) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
          last_score += 1;
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
          last_score += 0;
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: Text(
                "True",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: Text(
                  "False",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                onPressed: () {
                  checkAnswer(false);
                }),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
