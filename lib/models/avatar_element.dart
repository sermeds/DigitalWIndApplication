import 'package:digital_wind_application/models/avatar_element_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AvatarElement {
  AvatarElement(
      {required this.type, required this.color, required this.number});

  factory AvatarElement.copy(AvatarElement copy) =>
      AvatarElement(type: copy.type, color: copy.color, number: copy.number);

  final AvatarElementType type;
  final int number;
  Color color;

  factory AvatarElement.fromJson(Map<String, dynamic> json) => AvatarElement(
      type: AvatarElementType.fromJson(json['type']),
      color: Color(json['color'] as int),
      number: json['number']);

  Map<String, dynamic> toJson() =>
      {'type': type, 'color': color.value, 'number': number};
}
