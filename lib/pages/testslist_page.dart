import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/components/mainscaffold.dart';
import 'package:digital_wind_application/models/question.dart';
import 'package:digital_wind_application/models/test.dart';
import 'package:digital_wind_application/pages/subpages/test_page.dart';
import 'package:digital_wind_application/utils/test_difficulty.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "Testing")
class TestsList extends StatefulWidget {
  final List<Test> tests = [
    Test(title: "Hello World", difficulty: Difficulty.medium, questions: [
      Question(
          content: "Sex",
          answers: ["Male", "Female", "Yes", "No"],
          rightAnswer: 2)
    ]),
    Test(
        title: "Goodbye",
        questions: [
          Question(
              content: "One",
              answers: ["Male", "Female", "Yes", "No"],
              rightAnswer: 2),
          Question(
              content: "Two",
              answers: ["Male", "Female", "Yes", "No"],
              rightAnswer: 2),
          Question(
              content: "Three",
              answers: ["Male", "Female", "Yes", "No"],
              rightAnswer: 2)
        ],
        difficulty: Difficulty.easy)
  ];

  @override
  State<StatefulWidget> createState() {
    return _TestsListState();
  }
}

class _TestsListState extends State<TestsList> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      index: 2,
      body: Center(
        child: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text(
                      "${widget.tests[index].title} (${widget.tests[index].difficulty})"),
                  subtitle: widget.tests[index].percent != null
                      ? widget.tests[index].percent == 100
                          ? const Text("Тест полностью пройден")
                          : Text(widget.tests[index].percent.toString())
                      : const Text("Тест не пройден"),
                  enabled: widget.tests[index].percent == null ||
                      widget.tests[index].percent! < 100,
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TestingPage(test: widget.tests[index])))
                        .then((value) {
                      if (value != null) {
                        setState(() {
                          if (widget.tests[index].percent == null || value > widget.tests[index].percent) {
                            widget.tests[index].percent = value;
                          }
                        });
                      }
                    });
                  },
                ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: widget.tests.length),
      ),
    );
  }
}
