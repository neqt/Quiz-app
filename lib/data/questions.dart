import 'package:flutter_application_1/models/quiz_question.dart';

List<QuizQuestion> questions = [
  const QuizQuestion(
    'In Flutter, which layout widget is commonly used to create a grid of items with a fixed number of columns?',
    [
      'GridView',
      'Row',
      'Column',
      'ListView',
    ],
    1,
  ),
  const QuizQuestion(
    'What parameter is used to specify the text to display inside a \'Text\' widget?',
    [
      'Child',
      'Text',
      'Label',
      'Data',
    ],
    1,
  ),
  const QuizQuestion(
    'Which widget is used as the root of a Flutter application\'s widget hierarchy?',
    [
      'MaterialApp',
      'Scaffold',
      'AppWidget',
      'MainWidget',
    ],
    2,
  ),
  const QuizQuestion(
    'How should you update data inside of StatefulWidgets?',
    [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
    3,
  ),
  const QuizQuestion(
    'What feature in Flutter allows developers to see immediate changes to their code without restarting the whole app?',
    [
      'Hot Reload',
      'Quick Reload',
      'Instant Update',
      'Fast Refresh',
    ],
    3,
  ),
];
