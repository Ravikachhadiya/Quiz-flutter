import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetHandler;

  Result(this.score, this.resetHandler);

  String get scorePhrases {
    String resultString;
    if (score <= 8) {
      resultString = 'You are awesome!';
    } else if (score <= 12) {
      resultString = 'You are prittier!';
    } else if (score <= 16) {
      resultString = 'You are Strange?';
    } else {
      resultString = 'You are bad!';
    }
    return resultString;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            scorePhrases,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Reset Quiz!',
            ),
            textColor: Colors.blue,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
