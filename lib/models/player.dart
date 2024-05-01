import 'package:digital_wind_application/models/player_sex.dart';

class Player {
  String firstname;
  String? lastname;
  int exp;
  int balance;
  PlayerSex sex;

  Player(
      {required this.firstname,
      this.lastname,
      required this.balance,
      required this.exp,
      required this.sex});

  factory Player.fromJson(Map<String, dynamic> json) => Player(
      firstname: json['firstname'],
      balance: json['balance'],
      exp: json['exp'],
      lastname: json['lastname'],
      sex: PlayerSex.fromJson(json['sex']));

  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'lastname': lastname,
        'balance': balance,
        'exp': exp,
        'sex': sex
      };
}
