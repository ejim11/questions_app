import 'package:flutter/material.dart';
import 'package:questions_app/data/questions.dart';
import 'package:questions_app/questions_screen.dart';
import 'package:questions_app/result_screen.dart';
import 'package:questions_app/start_screen.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // created a state that manages the active screen
  var activeScreen = 'start-screen';

  // a list of string state that manages the selected answers
  List<String> selectedAnswers = [];
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);
  // }

// function that manages the switching of screens
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

// function that manages choosing an answer
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

// function for restarting the quiz
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screen = QuestionsScreen(onSelectAnswers: chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      screen =
          ResultScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purpleAccent, Colors.purple],
                begin: startAlignment,
                end: endAlignment),
          ),
          child: screen,
        ),
      ),
    );
  }
}
