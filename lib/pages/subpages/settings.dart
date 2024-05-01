import 'dart:async';

import 'package:digital_wind_application/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
  final themes = ["Светлая", "Темная"];

  late String _selectedTheme =
      themes[AppDataProvider.of(context)!.appData.settings.theme];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Настройки"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Text("Темы"),
                      ),
                      ...themes.map(
                        (th) => Row(
                          children: [
                            Radio<String>(
                              value: th,
                              activeColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              groupValue: _selectedTheme,
                              onChanged: (value) {
                                setState(
                                  () {
                                    _selectedTheme = value!;
                                    AppDataProvider.of(context)!
                                        .appData
                                        .settings
                                        .theme = themes.indexOf(value);
                                    AppDataProvider.of(context)!
                                        .appData
                                        .saveSettings();
                                  },
                                );
                              },
                            ),
                            Text(
                              th,
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future gotoSettings(BuildContext context) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => const SettingsPage()));
}
