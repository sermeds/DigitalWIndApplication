import 'package:flutter/material.dart';

class QuizQuestion extends StatefulWidget {
  const QuizQuestion(
      {super.key,
      required this.question,
      required this.answers,
      this.controller,
      this.defaultValue});

  final String question;

  final List<String> answers;

  final ValueNotifier? controller;

  final int? defaultValue;

  @override
  State<StatefulWidget> createState() {
    return QuizQuestionState();
  }
}

class QuizQuestionState extends State<QuizQuestion> {
  late String? _selected =
      widget.defaultValue != null ? widget.answers[widget.defaultValue!] : null;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(widget.question),
      ...widget.answers.map((answer) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<String>(
                  value: answer,
                  groupValue: _selected,
                  activeColor: Theme.of(context).colorScheme.onPrimary,
                  onChanged: (answer) {
                    setState(() {
                      _selected = answer;
                    });
                    if (widget.controller != null) {
                      widget.controller!.value = answer;
                    }
                  }),
              Text(answer)
            ],
          )),
    ]));
  }
}
