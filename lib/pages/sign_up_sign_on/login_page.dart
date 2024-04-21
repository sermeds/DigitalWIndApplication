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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 0),
              ),
              Image.asset(
                "lib/resources/images/appIcon.png",
                width: 150,
                height: 150,
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
                        labelText: "Логин",
                        labelStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Пароль",
                        labelStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                      obscureText: true,
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
                  login(context);
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: Text(
                  "Вход",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              SizedBox(
                width: 200,
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
          ),
        ),
      ),
    );
  }
}
