import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:questions_app/answer_button.dart';
import 'package:questions_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswers});

// the function for selecting answers passed as a prop
  final void Function(String answer) onSelectAnswers;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  // the state for managing the queestions, it changes based on index
  var currentQuestionIndex = 0;

// function for answering questions
  void answerQuestion(String answer) {
    // select the answer
    widget.onSelectAnswers(answer);

    // move to next question
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 201, 240, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map(
                  (answer) => AnswerButton(
                      answerText: answer,
                      onTap: () {
                        answerQuestion(answer);
                      }),
                ),
          ],
        ),
      ),
    );
  }
}
