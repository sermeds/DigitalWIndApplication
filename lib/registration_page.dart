import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/app_router.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

@RoutePage()
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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

  void registration(BuildContext context) {
    context.router.popUntil((route) => false);
    context.router.push(const HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(bottom: 75),
          ),
          SizedBox(
            child: Image.asset("lib/resources/images/appIcon.png"),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 25),
          ),
          SizedBox(
            width: 300,
            child: Text(
              "DigitalWind Application",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 35),
          ),
          SizedBox(
            width: 250.0,
            child: TextFormField(
              decoration: const InputDecoration(labelText: "Логин"),
              keyboardType: TextInputType.emailAddress,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Container(
            width: 250.0,
            padding: const EdgeInsets.only(top: 10.0),
            child: TextFormField(
              decoration: const InputDecoration(labelText: "Пароль"),
              obscureText: true,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
          ),
          ElevatedButton(
            onPressed: () {
              registration(context);
            },
            style: ButtonStyle(
                alignment: Alignment.center,
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Theme.of(context).highlightColor)),
            child: Text(
              "Зарегистрироваться",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          SizedBox(
            width: 175,
            child: TextButton(
              child: Text(
                "Первый раз тут? Пройдите регистрацию!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              onPressed: () {},
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 40),
          ),
          SizedBox(
            width: 350,
            child: Text(
              "Совет дня:",
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          )
        ],
      )),
    );
  }
}
