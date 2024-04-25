import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/app_router.dart';
import 'package:digital_wind_application/components/custom_date_picker.dart';
import 'package:flutter/material.dart';

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

  void registrationThreeStep(BuildContext context) {
    // ignore: dead_code
    if (false) {
      //var sex = currentGender == 0 ? "Male" : "Female";
      // Запрос БД (loginController.text; и passwordController.text;)
      context.router.replaceAll([const HomeRoute()]);
    }
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dopNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      width: 300,
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        color: Theme.of(context).dialogBackgroundColor,
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Имя",
                              labelStyle:
                                  Theme.of(context).textTheme.labelMedium,
                            ),
                            keyboardType: TextInputType.name,
                            style: Theme.of(context).textTheme.labelMedium,
                            controller: nameController,
                            validator: (value) {
                              RegExp regex = RegExp(r'^[а-яА-ЯёЁa-zA-Z]+$');
                              if (value == null || value.isEmpty) {
                                return 'Введите имя!';
                              } else if (value.length < 2 ||
                                  !regex.hasMatch(value)) {
                                return 'Имя не корректно!';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Фамилия",
                              labelStyle:
                                  Theme.of(context).textTheme.labelMedium,
                            ),
                            keyboardType: TextInputType.name,
                            style: Theme.of(context).textTheme.labelMedium,
                            controller: dopNameController,
                            validator: (value) {
                              RegExp regex = RegExp(r'^[а-яА-ЯёЁa-zA-Z]+$');
                              if (value == null || value.isEmpty) {
                                return 'Введите фамилию!';
                              } else if (value.length < 2 ||
                                  !regex.hasMatch(value)) {
                                return 'Фамилия не корректна!';
                              }
                              return null;
                            },
                          ),
                          CustomDatePicker(
                            textEditingController: dateController,
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
                        if (_formKey.currentState!.validate()) {
                          registrationThreeStep(context);
                        }
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
                  ],
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
