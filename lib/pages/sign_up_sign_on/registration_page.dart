import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/app_router.dart';
import 'package:digital_wind_application/pages/sign_up_sign_on/login_page.dart';
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

  void registrationOneStep(BuildContext context) {
    context.router.push(const RegistrationAgreementRoute());
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
                padding: EdgeInsets.only(bottom: 10),
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
                          labelText: "Логин",
                          labelStyle: Theme.of(context).textTheme.labelMedium),
                      keyboardType: TextInputType.emailAddress,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Пароль",
                          labelStyle: Theme.of(context).textTheme.labelMedium),
                      obscureText: true,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Потверждение пароля",
                          labelStyle: Theme.of(context).textTheme.labelMedium),
                      obscureText: true,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Телефон",
                          hintText: "+7(xxx)xxx-xx-xx",
                          labelStyle: Theme.of(context).textTheme.labelMedium),
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
                  registrationOneStep(context);
                },
                style: ButtonStyle(
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).highlightColor),
                ),
                child: Text(
                  "Продолжить регистрацию",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              ElevatedButton(
                onPressed: () {
                  // ignore: deprecated_member_use
                  context.router.pop(const LoginPage());
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
