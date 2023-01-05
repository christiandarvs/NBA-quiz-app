import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  const Answer(
      {super.key, required this.selectHandler, required this.answerText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 250,
          child: ElevatedButton(
              onPressed: (() {
                selectHandler();
              }),
              child: Text(answerText)),
        ),
      ],
    );
  }
}
