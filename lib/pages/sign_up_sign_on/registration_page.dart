import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/API/auth.dart';
import 'package:digital_wind_application/app_router.dart';
import 'package:digital_wind_application/pages/sign_up_sign_on/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
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
    context.router.push(RegistrationAgreementRoute(
        login: loginController.text,
        password: passwordController.text,
        phone: phoneController.value));
  }

  Future<bool> loginOriginality() async {
    return !await findByLogin(loginController.text);
  }

  bool orLogin = true;

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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.5.h),
                child: Image.asset(
                  "lib/resources/images/appIcon.png",
                  width: 35.w,
                  height: 17.5.h,
                ),
              ),
              SizedBox(
                width: 80.w,
                child: Text(
                  "Finigram",
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
                      padding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 3.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7.5.w)),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                ),
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
                              } else if (!orLogin) {
                                return 'Данный логин уже используется!';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                ),
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
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                ),
                                labelText: "Потверждение пароля",
                                labelStyle:
                                    Theme.of(context).textTheme.labelMedium),
                            obscureText: true,
                            style: Theme.of(context).textTheme.labelMedium,
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (passwordController.text !=
                                  confirmPasswordController.text) {
                                return 'Пароли не совпадают!';
                              }
                              return null;
                            },
                          ),
                          PhoneFormField(
                            autovalidateMode: AutovalidateMode.disabled,
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                ),
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
                    Padding(
                      padding: EdgeInsets.only(bottom: 4.h),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        loginOriginality().then((value) {
                          orLogin = value;
                          if (_formKey.currentState!.validate()) {
                            registrationOneStep(context);
                          }
                        });
                      },
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) =>
                                Theme.of(context).colorScheme.onPrimary),
                      ),
                      child: Text(
                        "Продолжить регистрацию",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: ElevatedButton(
                  onPressed: () {
                    // ignore: deprecated_member_use
                    context.router.pop(const LoginPage());
                  },
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).colorScheme.onPrimary),
                  ),
                  child: Text(
                    "Отменить регистрацию",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
