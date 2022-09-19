import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = [
    {
      'questionText': "What's your favorite color?",
      'answers': [
        {'text': 'Red', 'score': 1},
        {'text': 'Blue', 'score': 2},
        {'text': 'Yellow', 'score': 3},
        {'text': 'Green', 'score': 4},
      ]
    },
    {
      'questionText': "What's your favorite animal?",
      'answers': [
        {'text': 'Cat', 'score': 1},
        {'text': 'Hamster', 'score': 2},
        {'text': 'Dog', 'score': 3},
        {'text': 'Tiger', 'score': 4},
      ]
    },
    {
      'questionText': "What's your favorite subject?",
      'answers': [
        {'text': 'Math', 'score': 1},
        {'text': 'Science', 'score': 2},
        {'text': 'Music', 'score': 3},
        {'text': 'Art', 'score': 4},
      ]
    },
    {
      'questionText': "What's your favorite sport?",
      'answers': [
        {'text': 'Swimming', 'score': 1},
        {'text': 'Basketball', 'score': 2},
        {'text': 'Soccer', 'score': 3},
        {'text': 'Baseball', 'score': 4},
      ]
    },
  ];
  void _answerQuestion(int score) {
    setState(() {
      _questionIndex += 1;
      _totalScore += score;
    });
    if (kDebugMode) {
      print(_questionIndex);
      print(_totalScore);
    }
  }

  void _reset() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
    if (kDebugMode) {
      print('Reset');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter mobile app')),
        body: _questionIndex < _questions.length
            ? Quiz(
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
                questions: _questions,
              )
            : Result(resultScore: _totalScore, restartQuiz: _reset),
      ),
    );
  }
}
