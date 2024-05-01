import 'package:digital_wind_application/models/test.dart';
import 'package:digital_wind_application/pages/subpages/test_page.dart';
import 'package:flutter/material.dart';

class TestInfoPage extends StatelessWidget {
  const TestInfoPage({super.key, required this.test});

  final Test test;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Информация о тесте")),
        body: Center(
          child: Column(
            children: [
              Text('Название: ${test.title}'),
              Text('Процент за лучшую попытку: ${test.percent}'),
              Text('Вопросы: ${test.questions.length}'),
              Text(test.description ?? "Без описания"),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TestingPage(test: test)))
                      .then((value) => Navigator.pop(context, value));
                },
                child: Text(
                  "Пройти тест",
                  style: Theme.of(context).textTheme.headlineMedium,
                ))));
  }
}
