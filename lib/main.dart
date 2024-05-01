import 'package:digital_wind_application/API/file_storage.dart';
import 'package:digital_wind_application/app_router.dart';
import 'package:digital_wind_application/models/settings.dart';
import 'package:digital_wind_application/models/test.dart';
import 'package:flutter/material.dart';

class AppDataProvider extends InheritedWidget {
  const AppDataProvider(
      {required this.appData, required super.child, super.key});

  final AppData appData;

  static AppDataProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDataProvider>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class AppData {
  AppData({required this.settingsStorage, required this.testsStorage}) {
    testsStorage.readValue().then((value) {
      for (var i in value!) {
        tests.add(Test.fromJson(i));
      }
    });

    settingsStorage.readValue().then((value) {
      if (value != null) {
        settings = Settings.fromJson(value);
      }
      else{
        settings = Settings();
        settingsStorage.writeValue(settings);
      }
    });
  }

  final SingleValueFileStorage<List> testsStorage;

  final SingleValueFileStorage<Settings> settingsStorage;

  late Settings settings;

  String? token;
  String? refreshToken;

  Future saveTests() async {
    await testsStorage.writeValue(tests);
  }

  Future saveSettings() async {
    await settingsStorage.writeValue(settings);
  }

  final List<Test> tests = [];
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppDataProvider(
      appData: AppData(
          testsStorage: SingleValueFileStorage("tests"),
          settingsStorage: SingleValueFileStorage("settings")),
      child: const AppAutoRouter()));
}
