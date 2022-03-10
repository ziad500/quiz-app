import 'package:flutter/material.dart';
import 'package:quiz_app0/main.dart';

class Result extends StatelessWidget {
  final void Function() resultquiz;
  final result;

  Result(this.resultquiz, this.result);

  String get resultphrase {
    String resultText = "";
    if (result >= 80) {
      resultText = "Very Good";
    } else if (result >= 60) {
      resultText = "Good";
    } else if (result <= 50) {
      resultText = "Very Bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Your Score is $result",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: b),
        ),
        Text(
          "$resultphrase",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 45, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        TextButton(
          onPressed: resultquiz,
          child: Text(
            "Restart The App ",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        )
      ],
    ));
  }
}
