import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/components/mainscaffold.dart';
import 'package:digital_wind_application/models/question.dart';
import 'package:digital_wind_application/models/test.dart';
import 'package:digital_wind_application/pages/subpages/test_page.dart';
import 'package:digital_wind_application/utils/test_difficulty.dart';
import 'package:digital_wind_application/utils/test_utils.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "Testing")
class TestsList extends StatefulWidget {
  final List<Test> tests = [
    Test(title: "Hello World", difficulty: Difficulty.medium, questions: [
      Question(content: "Yes", answers: ["Yes", "No"], rightAnswer: 0)
    ]),
    Test(
        title: "Goodbye",
        questions: [
          Question(content: "One", answers: ["Yes", "No"], rightAnswer: 0),
          Question(content: "Two", answers: ["Yes", "No"], rightAnswer: 0),
          Question(content: "Three", answers: ["Yes", "No"], rightAnswer: 0)
        ],
        difficulty: Difficulty.easy)
  ];

  @override
  State<StatefulWidget> createState() {
    return _TestsListState();
  }
}

class _TestsListState extends State<TestsList> {
  _TestsListState() {
    _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) => setState(() {
              for (var elem in widget.tests) {
                if (elem.time < TEST_TIMER) {
                  elem.time++;
                }
              }
            }));
  }

  late final Timer _timer;

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

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
                          : Text(
                              "Пройден на ${widget.tests[index].percent}%${widget.tests[index].time < TEST_TIMER ? ", следующая попытка через ${TEST_TIMER - widget.tests[index].time}" : ""}")
                      : const Text("Тест не пройден"),
                  enabled: widget.tests[index].percent == null ||
                      widget.tests[index].percent! < 100 &&
                          widget.tests[index].time >= TEST_TIMER,
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TestingPage(test: widget.tests[index])))
                        .then((value) {
                      if (value != null) {
                        setState(() {
                          if (widget.tests[index].percent == null ||
                              value > widget.tests[index].percent) {
                            widget.tests[index].percent = value;
                          }
                          widget.tests[index].time = 0;
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
