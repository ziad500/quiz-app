import 'package:flutter/material.dart';
import 'package:quiz_app0/main.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Text(
            questionText,
            style: TextStyle(fontSize: 30, color: b),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
