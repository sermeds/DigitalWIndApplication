import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

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
    if (false) {
      //Сюда результат
      //http.get()
      // Запрос БД (loginController.text; и passwordController.text;)
      context.router.popUntil((route) => false);
      context.router.push(const HomeRoute());
      loginErrorController.text = "";
    } else {
      loginErrorController.text = "Неправильный логин или пароль.";
    }
  }

  String getAdvice() {
    return "Не кусай сиську, которая тебя кормит!";
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController loginErrorController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.5.h),
                child: Image.asset(
                  "lib/resources/images/appIcon.png",
                  width: 35.w,
                  height: 17.5.h,
                ),
              ),
              SizedBox(
                width: 80.h,
                child: Text(
                  "DigitalWind Application",
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 3.h),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      width: 80.w,
                      padding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7.5.w)),
                        color: Theme.of(context).dialogBackgroundColor,
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Логин",
                              labelStyle:
                                  Theme.of(context).textTheme.labelMedium,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            style: Theme.of(context).textTheme.labelMedium,
                            maxLength: 30,
                            controller: loginController,
                            validator: (value) {
                              RegExp regex = RegExp(r'\W');
                              if (value == null || value.isEmpty) {
                                return 'Введите логин!';
                              } else if (value.length < 4 ||
                                  regex.hasMatch(value)) {
                                return 'Такого логина не существует';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Пароль",
                              labelStyle:
                                  Theme.of(context).textTheme.labelMedium,
                            ),
                            obscureText: true,
                            style: Theme.of(context).textTheme.labelMedium,
                            maxLength: 50,
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Введите пароль!';
                              } else if (value == "admin") {
                                return null;
                              } else if (value.length < 8 ||
                                  !isPasswordValid(value)) {
                                return 'Пароль некорректен!';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: loginErrorController,
                            textAlign: TextAlign.center,
                            enabled: false,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3.h),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          login(context);
                        }
                      },
                      style: Theme.of(context).elevatedButtonTheme.style,
                      child: Text(
                        "Вход",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 1.h, bottom: 3.h),
                width: 50.w,
                child: TextButton(
                  child: Column(
                    children: [
                      Text(
                        "Первый раз тут?",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        "Пройдите регистрацию!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ],
                  ),
                  onPressed: () {
                    context.router.push(const RegistrationRoute());
                  },
                ),
              ),
              SizedBox(
                width: 80.w,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7.5.w),
                    ),
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

bool isPasswordValid(String password) {
  final containsUpperCase = RegExp(r'[A-Z]').hasMatch(password);
  final containsLowerCase = RegExp(r'[a-z]').hasMatch(password);
  final containsNumber = RegExp(r'\d').hasMatch(password);
  return containsUpperCase && containsLowerCase && containsNumber;
}
