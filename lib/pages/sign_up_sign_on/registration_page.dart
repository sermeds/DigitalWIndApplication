import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/app_router.dart';
import 'package:digital_wind_application/pages/sign_up_sign_on/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_form_field/phone_form_field.dart';

@RoutePage()
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  void initState() {
    phoneController.changeCountry(IsoCode.RU);
    super.initState();
  }

  void registrationOneStep(BuildContext context) {
    phoneController.value.international;
    loginController.text;
    passwordController.text;
    if (true) {
      context.router.push(const RegistrationAgreementRoute());
    }
  }

  bool loginOriginality() {
    if (loginController.text.toUpperCase() != "Kain".toUpperCase()) return true;
    return false;
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  PhoneController phoneController = PhoneController();

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
                                labelText: "Логин",
                                labelStyle:
                                    Theme.of(context).textTheme.labelMedium),
                            keyboardType: TextInputType.name,
                            style: Theme.of(context).textTheme.labelMedium,
                            controller: loginController,
                            validator: (value) {
                              RegExp regex = RegExp(r'\W');
                              if (value == null || value.isEmpty) {
                                return 'Введите логин!';
                              } else if (value.length < 4 ||
                                  regex.hasMatch(value)) {
                                return 'Логин некорректен!';
                              } else if (!loginOriginality()) {
                                return 'Данный логин уже используется!';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Пароль",
                                labelStyle:
                                    Theme.of(context).textTheme.labelMedium),
                            obscureText: true,
                            style: Theme.of(context).textTheme.labelMedium,
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Введите пароль!';
                              } else if (value.length < 8 ||
                                  !isPasswordValid(value)) {
                                return 'Пароль некорректен!';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Потверждение пароля",
                                labelStyle:
                                    Theme.of(context).textTheme.labelMedium),
                            obscureText: true,
                            style: Theme.of(context).textTheme.labelMedium,
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (passwordController.text !=
                                  confirmPasswordController.text) {
                                return 'Пароли не совавдвют!';
                              }
                              return null;
                            },
                          ),
                          PhoneFormField(
                            autovalidateMode: AutovalidateMode.disabled,
                            decoration: InputDecoration(
                                labelText: "Телефон",
                                labelStyle:
                                    Theme.of(context).textTheme.labelMedium),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(13)
                            ],
                            keyboardType: TextInputType.phone,
                            style: Theme.of(context).textTheme.labelMedium,
                            controller: phoneController,
                            validator: (value) {
                              if (value!.nsn.isEmpty || value.nsn == "") {
                                return 'Введите номер телефона!';
                              } else if (value.nsn.length != 10) {
                                return 'Номер не корректен';
                              }
                              return null;
                            },
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
                          registrationOneStep(context);
                        }
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
                  ],
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
