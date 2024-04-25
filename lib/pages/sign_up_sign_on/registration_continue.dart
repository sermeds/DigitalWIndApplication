import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/app_router.dart';
import 'package:digital_wind_application/utilitys/custom_date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  var dateInput = TextEditingController();
  var currentGender = 0;

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
                        labelStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                      keyboardType: TextInputType.name,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Фамилия",
                        labelStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                      keyboardType: TextInputType.name,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    CustomDatePicker(
                      textEditingController: dateInput,
                      text: "Дата рождения",
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Пол",
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 135,
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Муж.'),
                            leading: Radio<int>(
                              value: 0,
                              groupValue: currentGender,
                              onChanged: (value) {
                                setState(
                                  () {
                                    currentGender = value!;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 135,
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Жен.'),
                            leading: Radio<int>(
                              value: 1,
                              groupValue: currentGender,
                              onChanged: (value) {
                                setState(
                                  () {
                                    currentGender = value!;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
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
