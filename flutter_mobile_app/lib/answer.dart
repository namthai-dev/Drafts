import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Map answerText;
  final Function answerQuestion;

  const Answer(
      {super.key, required this.answerText, required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: ElevatedButton(
        onPressed: () => answerQuestion(answerText['score']),
        child: Text(answerText['text']),
      ),
    );
  }
}
