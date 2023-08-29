import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/quiz_bar.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
    required this.startQuiz,
    required this.createQuiz,
  });

  final void Function() startQuiz;
  final void Function() createQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const QuizBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to\nQuiz App!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade900,
              ),
            ),
            const SizedBox(height: 40),
            Image.asset(
              'assets/images/quiz-logo.png',
              color: Colors.blueGrey.shade300,
              width: 250,
            ),
            const SizedBox(
              height: 60,
            ),
            ElevatedButton.icon(
              onPressed: startQuiz,
              icon: const Icon(Icons.play_arrow),
              label: const Text(
                'Start Quiz',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey.shade900,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'or',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blueGrey.shade300,
              ),
            ),
            TextButton.icon(
              onPressed: createQuiz,
              icon: Icon(
                Icons.add,
                color: Colors.blueGrey.shade900,
              ),
              label: Text(
                'Create Quiz',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade900,
                ),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
