import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/API/tests.dart';
import 'package:digital_wind_application/components/mainscaffold.dart';
import 'package:digital_wind_application/main.dart';
import 'package:digital_wind_application/pages/subpages/test_info_page.dart';
import 'package:digital_wind_application/utils/test_utils.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "Testing")
class TestsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestsListState();
  }
}

class _TestsListState extends State<TestsList> {
  _TestsListState() {

    getTests(AppDataProvider.of(context)!.appData.tokens!.accessToken).then((value){
      AppDataProvider.of(context)!.appData.tests = value;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        for (var elem in AppDataProvider.of(context)!.appData.tests) {
          if (elem.time > 0) {
            elem.time--;
          }
        }
      });
    });
    });    
  }

  late final Timer? _timer;

  @override
  void dispose() {
    super.dispose();
    if(_timer != null) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      index: 2,
      body: Center(
        child: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text(
                      "${AppDataProvider.of(context)!.appData.tests[index].title} (${AppDataProvider.of(context)!.appData.tests[index].difficulty})"),
                  subtitle: AppDataProvider.of(context)!
                              .appData
                              .tests[index]
                              .percent !=
                          null
                      ? AppDataProvider.of(context)!
                                  .appData
                                  .tests[index]
                                  .percent ==
                              100
                          ? const Text("Тест полностью пройден")
                          : Text(
                              "Пройден на ${AppDataProvider.of(context)!.appData.tests[index].percent}%${AppDataProvider.of(context)!.appData.tests[index].time > 0 ? ", следующая попытка через ${AppDataProvider.of(context)!.appData.tests[index].time}" : ""}")
                      : const Text("Тест не пройден"),
                  enabled: AppDataProvider.of(context)!
                              .appData
                              .tests[index]
                              .percent ==
                          null ||
                      AppDataProvider.of(context)!
                                  .appData
                                  .tests[index]
                                  .percent! <
                              100 &&
                          AppDataProvider.of(context)!
                                  .appData
                                  .tests[index]
                                  .time ==
                              0,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TestInfoPage(
                                test: AppDataProvider.of(context)!
                                    .appData
                                    .tests[index]))).then((value) {
                      if (value != null) {
                        setState(() {
                          if (AppDataProvider.of(context)!
                                      .appData
                                      .tests[index]
                                      .percent ==
                                  null ||
                              value >
                                  AppDataProvider.of(context)!
                                      .appData
                                      .tests[index]
                                      .percent) {
                            AppDataProvider.of(context)!
                                .appData
                                .tests[index]
                                .percent = value;
                          }
                          AppDataProvider.of(context)!
                              .appData
                              .tests[index]
                              .time = TEST_TIMER;
                        });
                      }
                    });
                  },
                ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: AppDataProvider.of(context)!.appData.tests.length),
      ),
    );
  }
}
