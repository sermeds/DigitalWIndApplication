import 'package:digital_wind_application/API/tests.dart';
import 'package:digital_wind_application/components/quiz_question.dart';
import 'package:digital_wind_application/main.dart';
import 'package:digital_wind_application/models/test.dart';
import 'package:digital_wind_application/pages/subpages/testresult_page.dart';
import 'package:flutter/material.dart';

class TestingPage extends StatefulWidget {
  final Test test;

  late final List<ValueNotifier> subs = [
    for (var _ in test.questions) ValueNotifier(null)
  ];

  TestingPage({super.key, required this.test});

  @override
  State<StatefulWidget> createState() {
    return _TestingPageState();
  }
}

class _TestingPageState extends State<TestingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.test.title)),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ...widget.test.questions
                    .asMap()
                    .map((i, e) => MapEntry(
                        i,
                        QuizQuestion(
                            question: e.content,
                            answers: e.answers,
                            controller: widget.subs[i])))
                    .values,
                TextButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () {
                      var answers = widget.subs
                          .map((e) => e.value != null ? e.value as String : "")
                          .toList();
                      sendAnswers(0, answers, AppDataProvider.of(context)!.appData.tokens!.accessToken);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TestResult(
                                  test: widget.test,
                                  answers: answers))).then((value) {
                        Navigator.pop(context, value);
                      });
                    },
                    child: const Text("Отправить"))
              ]
                  .map((e) =>
                      Container(margin: const EdgeInsets.all(8.0), child: e))
                  .toList(),
            ),
          ),
        ));
  }
}
