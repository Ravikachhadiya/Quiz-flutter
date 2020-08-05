import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'question': 'what\'s your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'Pink', 'score': 3},
        {'text': 'Yellow', 'score': 7}
      ]
    },
    {
      'question': 'what\'s your favorite animal?',
      'answers': [
        {'text': 'Elephant', 'score': 1},
        {'text': 'Lion', 'score': 10},
        {'text': 'Tiger', 'score': 5}
      ]
    },
    {
      'question': 'what\'s your favorite Phone?',
      'answers': [
        {'text': 'IPhone', 'score': 10},
        {'text': 'MI', 'score': 1},
        {'text': 'Samsung', 'score': 5}
      ]
    }
  ];
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
