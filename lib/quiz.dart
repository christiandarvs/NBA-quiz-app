import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  const Quiz(
      {super.key,
      required this.questions,
      required this.answerQuestion,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Question(
            questionText: questions[questionIndex]['questionText'] as String,
          ),
          ...(questions[questionIndex]['answers'] as List<String>)
              .map((answer) {
            return Answer(selectHandler: answerQuestion(), answerText: answer);
          }).toList()
        ],
      ),
    ));
  }
}
