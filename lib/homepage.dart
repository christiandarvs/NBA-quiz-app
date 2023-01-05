import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _questionIndex = 0;
  final questions = [
    {
      'questionText': 'Which team won the 2017 NBA finals?',
      'answers': [
        'Boston Celtics',
        'Cleaveland Cavaliers',
        'Golden State Warriors'
      ]
    },
    {
      'questionText': 'Who is the winner of 2018 NBA Slam Dunk Contest?',
      'answers': ['Zach LaVine', 'Donovan Mitchell', 'Aaron Gordon']
    },
    {
      'questionText': 'Which team has won the most NBA titles?',
      'answers': ['Boston Celtics', 'Los Angeles Lakers', 'Chicago Bulls']
    },
    {
      'questionText': 'Who is the winner of 2016 NBA Slam Dunk Contest?',
      'answers': ['Aaron Gordon', 'Zach Levine', 'Andre Drummond']
    },
    {
      'questionText': 'Who is the shortest player of all-time?',
      'answers': ['Mugsy Bogues', 'Isaiah Thomas', 'Spud Webb']
    },
    {
      'questionText':
          'What country is NBA basketball player Yao Ming originally from?',
      'answers': ['Thailand', 'China', 'Japan']
    }
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
      debugPrint('$_questionIndex');
    });
    if (_questionIndex < questions.length) {
      debugPrint('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('NBA Quiz App'),
        ),
        body: _questionIndex < questions.length
            ? SafeArea(
                child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Question(
                      questionText:
                          questions[_questionIndex]['questionText'] as String,
                    ),
                    ...(questions[_questionIndex]['answers'] as List<String>)
                        .map((answer) {
                      return Answer(
                          selectHandler: _answerQuestion, answerText: answer);
                    }).toList()
                  ],
                ),
              ))
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Result(),
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          _questionIndex = 0;
                        });
                      }),
                      child: const Text('Retake Quiz'))
                ],
              ));
  }
}
