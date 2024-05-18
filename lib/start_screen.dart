import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 250,
          //   ),
          // ),
          const SizedBox(height: 80),
          Text(
            'Learn flutter the fun way',
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 240, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(width: 1.0, color: Colors.white),
            ),
            onPressed: () {
              startQuiz();
            },
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
