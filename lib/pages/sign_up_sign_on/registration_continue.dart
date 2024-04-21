import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/app_router.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

@RoutePage()
class RegistrationContinuePage extends StatefulWidget {
  const RegistrationContinuePage({super.key});

  @override
  State<StatefulWidget> createState() => _RegistrationContinuePageState();
}

class _RegistrationContinuePageState extends State<RegistrationContinuePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<String> get _dbPath async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String dbPath = path.join(databasesPath, 'demo2.db');

    return dbPath;
  }

  void registrationThreeStep(BuildContext context) {
    context.router.replaceAll([const HomeRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 25),
              ),
              Image.asset(
                "lib/resources/images/appIcon.png",
                height: 150,
                width: 150,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 25),
              ),
              SizedBox(
                width: 300,
                child: Text(
                  "DigitalWind Application",
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 35),
              ),
              Container(
                width: 300,
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  color: Theme.of(context).dialogBackgroundColor,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Имя",
                          labelStyle: Theme.of(context).textTheme.labelMedium),
                      keyboardType: TextInputType.emailAddress,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Фамилия",
                          labelStyle: Theme.of(context).textTheme.labelMedium),
                      keyboardType: TextInputType.emailAddress,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    InputDatePickerFormField(
                        firstDate: DateTime(2000), lastDate: DateTime(2024)),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Дата рождения",
                          labelStyle: Theme.of(context).textTheme.labelMedium),
                      keyboardType: TextInputType.emailAddress,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Пол",
                          labelStyle: Theme.of(context).textTheme.labelMedium),
                      keyboardType: TextInputType.emailAddress,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              ElevatedButton(
                onPressed: () {
                  registrationThreeStep(context);
                },
                style: ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).highlightColor)),
                child: Text(
                  "Завершить регистрацию",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              ElevatedButton(
                onPressed: () {
                  context.router.replaceAll([const LoginRoute()]);
                },
                style: ButtonStyle(
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).highlightColor),
                ),
                child: Text(
                  "Отменить регистрацию",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
