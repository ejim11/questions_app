import 'package:flutter/material.dart';
import 'package:questions_app/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.summaryData});

  final Map<String, Object> summaryData;

  @override
  Widget build(BuildContext context) {
    final isCorrect =
        summaryData['correct_answer'] == summaryData['user_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          questionIndex: (summaryData['question_index'] as int),
          isCorrectAnswer: isCorrect,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                summaryData['question'] as String,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                summaryData['correct_answer'] as String,
                style: const TextStyle(color: Colors.lime, fontSize: 15),
              ),
              Text(
                summaryData['user_answer'] as String,
                style: const TextStyle(color: Colors.teal),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        )
      ],
    );
  }
}
