import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/questions.dart';
import 'package:flutter_application_1/widgets/questions_summary/questions_summary.dart';
import 'package:flutter_application_1/widgets/quiz_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chooseAnswers,
    required this.onRestart,
  });

  final List<String> chooseAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chooseAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chooseAnswers[i],
        'score': chooseAnswers[i] == questions[i].answers[0]
            ? questions[i].score
            : 0,
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestion = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;
    final numWrongQuestion = numTotalQuestions - numCorrectQuestion;
    final resultScore = summaryData.fold<int>(
      0,
      (score, data) => score + (data['score'] as int),
    );
    final totalScores = questions.fold<int>(
      0,
      (total, question) => total + question.score,
    );
    final scorePercentage = (resultScore / (totalScores)) * 100;

    return Scaffold(
      appBar: const QuizBar(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade900,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.only(top: 30),
                alignment: Alignment.topCenter,
                child: CircularPercentIndicator(
                  radius: 120,
                  lineWidth: 10,
                  percent: scorePercentage / 100,
                  center: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Your Score\n',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: '$resultScore',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: ' /$totalScores pt',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  progressColor: Colors.white,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 70),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      QuestionSummary(summaryData),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton.icon(
                  onPressed: onRestart,
                  icon: const Icon(Icons.refresh),
                  label: const Text(
                    'Restart Quiz',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey.shade900,
                    padding:
                        const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    minimumSize: const Size(double.infinity, 0),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
          Positioned(
            top: 160,
            left: 2,
            child: Container(
              height: 160,
              width: 350,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    offset: const Offset(0, 1),
                    blurRadius: 3,
                    spreadRadius: 1,
                  ),
                ],
                color: Colors.blueGrey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 5),
                            Text(
                              '${scorePercentage.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: Colors.blueGrey.shade800,
                              ),
                            ),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.transparent,
                              child: Icon(
                                Icons.percent_rounded,
                                color: Colors.blueGrey.shade800,
                                size: 18,
                                weight: 10,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: Colors.blueGrey.shade800,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '$numTotalQuestions',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.blueGrey.shade800,
                              ),
                            ),
                            const SizedBox(width: 90),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Result Score',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 33, 33, 33),
                          ),
                        ),
                        Text(
                          'Total Question',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 33, 33, 33),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 5),
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: Colors.green.shade900,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '$numCorrectQuestion',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.green.shade900,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: Colors.red.shade900,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '$numWrongQuestion',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.red.shade900,
                              ),
                            ),
                            const SizedBox(width: 90),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 18),
                        Text(
                          'Correct',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 33, 33, 33),
                          ),
                        ),
                        SizedBox(width: 105),
                        Text(
                          'Wrong',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 33, 33, 33),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
