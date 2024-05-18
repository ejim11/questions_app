import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:questions_app/data/questions.dart';
import 'package:questions_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  // using a getter function
  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = questions.length;
    final totalCorrectAnswers = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $totalCorrectAnswers out of $totalQuestions questions correctly!',
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 201, 240, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionSummary(
              summaryData,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
                onPressed: onRestart,
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.refresh),
                label: const Text('Restart quiz')),
          ],
        ),
      ),
    );
  }
}
