import 'package:flutter/material.dart';

class QuizQuestion extends StatefulWidget {
  const QuizQuestion({super.key, required this.question, required this.answers});

  final String question;

  final List<String> answers;

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(widget.question),
      ...widget.answers.map((answer) => Row(children: [
            Radio<String>(
                value: answer,
                groupValue: _selected,
                onChanged: (answer) {
                  setState(() {
                    _selected = answer;
                  });
                }),
            Text(answer)
          ])),
    ]));
  }
}
