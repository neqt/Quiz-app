import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/questions_summary/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return SummaryItem(
              data,
              questionIndex: data['question_index'] as int,
              isCorrectAnswer: data['correct_answer'] == data['user_answer'],
            );
          }).toList(),
        ),
      ),
    );
  }
}
