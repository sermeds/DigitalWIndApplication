import 'package:digital_wind_application/models/avatar_element_type.dart';

class AvatarElementDTO {
  const AvatarElementDTO(
      {required this.type, required this.number, required this.color});
  final AvatarElementType type;
  final int number;
  final String color;

  factory AvatarElementDTO.fromJson(Map<String, dynamic> json) => AvatarElementDTO(type: json['type'], number: json['number'], color: json['color']);

  Map<String, dynamic> toJson() => {"type": type, "number": number, "color": color};
}
