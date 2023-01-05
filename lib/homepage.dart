import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int questionIndex = 0;
  var questions = [
    'Which team won the 2017 NBA finals?',
    'Who is the winner of 2018 NBA Slam Dunk Contest?',
    'Which team has won the most NBA titles?',
    'Who is the winner of 2016 NBA Slam Dunk Contest?',
    'Who is the shortest player of all-time?',
    'What country is NBA basketball player Yao Ming originally from?'
  ];

  void answerQuestion() {
    setState(() {
      questionIndex++;
      debugPrint('$questionIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Quiz App'),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                questions[questionIndex],
                style: GoogleFonts.poppins(fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: (() {
                  answerQuestion();
                }),
                child: const Text('Answer 1')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: (() {
                  answerQuestion();
                }),
                child: const Text('Answer 2')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: (() {
                  answerQuestion();
                }),
                child: const Text('Answer 3')),
          ],
        ),
      )),
    );
  }
}
