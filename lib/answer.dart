import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final void Function() x;
  Answer(this.x, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: x,
        child: Text(
          answerText,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
