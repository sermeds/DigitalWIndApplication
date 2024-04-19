import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/app_router.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

  void login(BuildContext context) {
    context.router.popUntil((route) => false);
    context.router.push(const HomeRoute());
  }

  String getAdvice() {
    return "Не кусай сиську, которая тебя кормит!";
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
              width: 300.0,
              child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    color: Theme.of(context).dialogBackgroundColor,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Логин"),
                        keyboardType: TextInputType.emailAddress,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Пароль"),
                        obscureText: true,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ))),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
          ),
          ElevatedButton(
            onPressed: () {
              login(context);
            },
            style: ButtonStyle(
                alignment: Alignment.center,
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Theme.of(context).highlightColor)),
            child: Text(
              "Вход",
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
              onPressed: () {
                context.router.push(const RegistrationRoute());
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 40),
          ),
          SizedBox(
            width: 350,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                color: Theme.of(context).dialogBackgroundColor,
              ),
              child: Text(
                "Совет дня: ${getAdvice()}",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      )),
    );
  }
}
