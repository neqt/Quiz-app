import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/questions.dart';
import 'package:flutter_application_1/models/quiz_question.dart';
import 'package:flutter_application_1/widgets/quiz_bar.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({
    super.key,
    required this.onBackToStart,
  });

  final void Function() onBackToStart;

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _questionController = TextEditingController();
  TextEditingController _scoreController = TextEditingController();
  List<TextEditingController> _answerControllers = [];

  @override
  void initState() {
    super.initState();
    _answerControllers = List.generate(2, (_) => TextEditingController());
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newQuestion = QuizQuestion(
        _questionController.text,
        _answerControllers.map((controller) => controller.text).toList(),
        int.parse(_scoreController.text),
      );

      questions.add(newQuestion);

      _questionController.clear();
      _answerControllers.forEach((controller) => controller.clear());
      _scoreController.clear();
    }
  }

  void _addAnswerField() {
    setState(() {
      _answerControllers.add(TextEditingController());
    });
  }

  void _removeAnswerField(index) {
    if (_answerControllers.length > 2) {
      setState(() {
        _answerControllers.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const QuizBar(
        showBackButton: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    'CREATE A NEW QUIZ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey.shade900,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: _questionController,
                    autofocus: false,
                    style: TextStyle(
                      color: Colors.blueGrey.shade900,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a question';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Question',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey.shade900,
                      ),
                      hintText: 'Enter your question here',
                      hintStyle: TextStyle(
                        color: Colors.blueGrey.shade300,
                        fontWeight: FontWeight.w200,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey.shade200,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey.shade400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  for (int i = 0; i < _answerControllers.length; i++)
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            controller: _answerControllers.length > i
                                ? _answerControllers[i]
                                : TextEditingController(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an answer choice';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Answer Choice ${i + 1}',
                              labelStyle: TextStyle(
                                color: Colors.blueGrey.shade900,
                              ),
                              hintText: 'Provide an answer',
                              hintStyle: TextStyle(
                                color: Colors.blueGrey.shade300,
                                fontWeight: FontWeight.w200,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueGrey.shade200,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueGrey.shade400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: i == 0,
                          child: SizedBox(
                            width: 110,
                            child: Text(
                              'Must be the Correct Answer',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.redAccent.shade400,
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: i == _answerControllers.length - 1,
                          child: SizedBox(
                            width: 35,
                            child: IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.green.shade800,
                              ),
                              onPressed: _addAnswerField,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: (_answerControllers.length - 1 > 1)
                              ? (i > 0)
                              : (i > 1),
                          child: SizedBox(
                            width: 35,
                            child: IconButton(
                              icon: Icon(
                                Icons.remove_circle,
                                color: Colors.red.shade900,
                              ),
                              onPressed: () {
                                _removeAnswerField(i);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: _scoreController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a score for the question';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Score',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey.shade900,
                      ),
                      hintText: 'Score for this question',
                      hintStyle: TextStyle(
                        color: Colors.blueGrey.shade300,
                        fontWeight: FontWeight.w200,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey.shade200,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey.shade400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: widget.onBackToStart,
                        style: OutlinedButton.styleFrom(
                          primary: Colors.blueGrey.shade900,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          side: BorderSide(
                            color: Colors.blueGrey.shade900,
                            width: 1.0,
                          ),
                        ),
                        child: Icon(
                          Icons.home_filled,
                          color: Colors.blueGrey.shade900,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey.shade900,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
