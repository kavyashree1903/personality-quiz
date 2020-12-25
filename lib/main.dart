import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  //widgets-->ui buidling blocks
  runApp(MyApp());
} //entrypoint to the application and calls build method

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What is your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 20},
        {'text': 'Red', 'score': 15},
        {'text': 'Pink', 'score': 10},
        {'text': 'White', 'score': 5}
      ],
    },
    {
      'questionText': 'What is your favourite animal?',
      'answers': [
        {'text': 'Lion', 'score': 20},
        {'text': 'Horse', 'score': 15},
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Bird', 'score': 5}
      ],
    },
    {
      'questionText': 'Who is your favourite music artist?',
      'answers': [
        {'text': 'Drake', 'score': 20},
        {'text': 'BTS', 'score': 15},
        {'text': 'Ed Sheeran', 'score': 10},
        {'text': 'Miley Cyrus', 'score': 5}
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('we have more question!');
    } else {
      print('no more question!!');
    }
  }

  @override //deliberateky overwriting build method
  //this widget is the root of your application
  //If a widget ‘A’ has children widgets, the BuildContext of widget ‘A’ will become the parent BuildContext of the direct children BuildContexts.
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
