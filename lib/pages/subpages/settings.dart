import 'dart:async';

import 'package:digital_wind_application/main.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
  final themes = ["Светлая", "Темная"];

  late String _selectedTheme = themes[AppDataProvider.of(context)!.appData.settings.theme];

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
            Row(
              children: [
                const Text("Тема"),
                ...themes.map((th) => Row(children: [
                      Radio<String>(
                          value: th,
                          groupValue: _selectedTheme,
                          onChanged: (value) {
                            setState(() {
                              _selectedTheme = value!;
                              AppDataProvider.of(context)!.appData.settings.theme = themes.indexOf(value);
                              AppDataProvider.of(context)!.appData.saveSettings();
                            });
                          }),
                      Text(th)
                    ])),
              ],
            )
          ],
        ),
      )),
    );
  }
}

Future gotoSettings(BuildContext context) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => const SettingsPage()));
}
