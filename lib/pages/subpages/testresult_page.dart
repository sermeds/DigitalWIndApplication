import 'package:digital_wind_application/models/test.dart';
import 'package:digital_wind_application/utils/test_utils.dart';
import 'package:flutter/material.dart';

class TestResult extends StatelessWidget {
  const TestResult({super.key, required this.test, required this.answers});

  final Test test;

  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    int percent = 0;

    for (int i = 0; i < answers.length; i++) {
      if (answers[i] ==
          test.questions[i].answers[test.questions[i].rightAnswer]) {
        percent++;
      }
    }

    percent *= 100;

    percent = percent ~/ answers.length;

    int rewardMaxXP = calcReward(answers.length, test.difficulty, REWARD_XP);
    int rewardMaxMoney =
        calcReward(answers.length, test.difficulty, REWARD_MONEY);

    return Scaffold(
      appBar: AppBar(title: const Text("Результаты теста")),
      // ignore: deprecated_member_use
      body: WillPopScope(
          onWillPop: () async{
              Navigator.pop(context, percent);
              return false;
          },
          child: Center(
              child: Column(children: [
        Text("Тест был пройден на $percent процентов"),
        Text(
            "Заработаны очки: ${calcRemaindReward(rewardMaxXP, percent, test.percent)}"),
        Text(
            "Заработаны деньги: ${calcRemaindReward(rewardMaxMoney, percent, test.percent)}"),
        TextButton(
            onPressed: () {
              Navigator.pop(context, percent);
            },
            child: const Text("ОК"))
      ]))),
    );
  }
}
