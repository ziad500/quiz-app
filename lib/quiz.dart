import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionindex;
  final Function answerquestion;

  Quiz(this.questions, this.questionindex, this.answerquestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionindex]['questionText'].toString()),
        ...(questions[questionindex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerquestion(answer['Score']), answer['Text'].toString());
        }).toList(),
      ],
    );
  }
}
