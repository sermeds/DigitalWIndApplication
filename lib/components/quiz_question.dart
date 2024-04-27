import 'package:flutter/material.dart';

class QuizQuestion extends StatefulWidget {
  const QuizQuestion({super.key, required this.question, required this.answers, this.controller});

  final String question;

  final List<String> answers;

  final ValueNotifier? controller;

  @override
  State<StatefulWidget> createState() {
    return QuizQuestionState();
  }
}

class QuizQuestionState extends State<QuizQuestion> {
  late String? _selected = widget.answers[0];

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(widget.question),
      ...widget.answers.map((answer) => Row(mainAxisSize: MainAxisSize.min,children: [
            Radio<String>(
                value: answer,
                groupValue: _selected,
                onChanged: (answer) {
                  setState(() {
                    _selected = answer;
                  });
                  if(widget.controller != null) {
                    widget.controller!.value = answer;
                  }
                }),
            Text(answer)
          ],)),
    ]));
  }
}
