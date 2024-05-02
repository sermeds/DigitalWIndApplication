import 'package:digital_wind_application/models/player_sex.dart';
import 'package:phone_form_field/phone_form_field.dart';

class RegisterInfo {
  String login;
  String password;
  String firstname;
  String? lastname;
  PlayerSex sex;
  String phone;
  DateTime birthday;

  RegisterInfo(
      {required this.firstname,
      this.lastname,
      required this.sex,
      required this.phone,
      required this.birthday,
      required this.login,
      required this.password});

  factory RegisterInfo.fromJson(Map<String, dynamic> json) => RegisterInfo(
      firstname: json['firstname'],
      login: json['login'],
      password: json['password'],
      lastname: json['lastname'],
      sex: PlayerSex.fromJson(json['sex']),
      phone: json['phone'],
      birthday: DateTime.parse(json['birthday']));

  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'lastname': lastname,
        'login': login,
        'password': password,
        'sex': sex,
        'phone': phone,
        'birthday': birthday.toIso8601String()
      };
}
