import 'package:flutter/material.dart';
import 'package:quiz_app0/quiz.dart';
import 'package:quiz_app0/result.dart';
import 'question.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Color w = Colors.white;
Color b = Colors.black;
Color B = Colors.blue;
Color G = Colors.grey.shade900;

class _MyAppState extends State<MyApp> {
  int _totalScore = 0;
  int _questionindex = 0;
  int num0 = 0;
  int num1 = 0;
  int num2 = 0;

  bool isSwitched = false;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'Text': 'Black', 'Score': 10},
        {'Text': 'Red', 'Score': 50},
        {'Text': 'Green', 'Score': 20},
        {'Text': 'yellow', 'Score': 30}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'Text': 'Rabbit', 'Score': 80},
        {'Text': 'Tiger', 'Score': 20},
        {'Text': 'Lion', 'Score': 10},
        {'Text': 'Cat', 'Score': 60}
      ]
    },
    {
      'questionText': 'What\'s your favorite sport?',
      'answers': [
        {'Text': 'Football', 'Score': 20},
        {'Text': 'Vallyball', 'Score': 10},
        {'Text': 'Swimming', 'Score': 30},
        {'Text': 'tennis', 'Score': 40}
      ]
    },
  ];

  void answerquestion(int score) {
    if (_questionindex == 0) num0 = score;
    if (_questionindex == 1) num1 = score;
    if (_questionindex == 2) num2 = score;

    _totalScore += score;
    setState(() {
      _questionindex += 1;
    });
  }

  void resetquiz() {
    setState(() {
      _questionindex = 0;
      _totalScore = 0;
      num0 = 0;
      num1 = 0;
      num2 = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: B,
          title: Text("Quiz App"),
          actions: [
            Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                    if (isSwitched == true) {
                      b = Colors.white;
                      w = Colors.black;
                      B = Colors.grey.shade900;
                      G = Colors.blue;
                    }
                    if (isSwitched == false) {
                      b = Colors.black;
                      w = Colors.white;
                      B = Colors.blue;
                      G = Colors.grey.shade900;
                    }
                  });
                })
          ],
        ),
        body: Container(
            color: w,
            child: Column(
              children: [
                _questionindex < _questions.length
                    ? Quiz(_questions, _questionindex, answerquestion)
                    : Result(resetquiz, _totalScore),
                FloatingActionButton(
                  onPressed: () {
                    if (_questionindex == 1) _totalScore -= num0;
                    if (_questionindex == 2) _totalScore -= num1;
                    if (_questionindex == 3) _totalScore -= num2;

                    setState(() {
                      if (_questionindex == 0) {
                      } else {
                        _questionindex--;
                      }
                    });
                  },
                  child: Icon(Icons.arrow_back),
                )
              ],
            )),
      ),
    );
  }
}
