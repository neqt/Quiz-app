import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/questions.dart';
import 'package:flutter_application_1/screens/questions_screen.dart';
import 'package:flutter_application_1/screens/result_screen.dart';
import 'package:flutter_application_1/screens/start_screen.dart';
import 'package:flutter_application_1/screens/create_quiz.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var _activeScreen = 'start-screen';
  final List<String> _selectedAnswer = [];

  void _switchScreen() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswer.add(answer);

    if (_selectedAnswer.length == questions.length) {
      setState(() {
        _activeScreen = 'result-screen';
      });
    }
  }

  void _startCreateQuiz() {
    setState(() {
      _activeScreen = 'create-quiz';
    });
  }

  void restartQuiz() {
    setState(() {
      _activeScreen = 'start-screen';
      _selectedAnswer.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(
      startQuiz: _switchScreen,
      createQuiz: _startCreateQuiz,
    );

    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: _chooseAnswer,
      );
    }

    if (_activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chooseAnswers: _selectedAnswer,
        onRestart: restartQuiz,
      );
    }

    if (_activeScreen == 'create-quiz') {
      screenWidget = CreateQuiz(
        onBackToStart: restartQuiz,
      );
    }

    return MaterialApp(
      theme: ThemeData(fontFamily: 'Prompt'),
      home: Scaffold(
        body: SafeArea(child: screenWidget),
      ),
    );
  }
}
