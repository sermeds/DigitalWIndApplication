import 'package:digital_wind_application/models/avatar_element.dart';
import 'package:digital_wind_application/models/avatar_element_type.dart';
import 'package:flutter/material.dart';

class AvatarSet {
  AvatarSet(
      {AvatarElement? clothes,
      AvatarElement? eyes,
      AvatarElement? face,
      AvatarElement? hair,
      AvatarElement? hat,
      AvatarElement? mouth}) {
    this.clothes = clothes ??
        AvatarElement(
            type: AvatarElementType.CLOTHES, color: Colors.black, number: 0);
    this.eyes = eyes ??
        AvatarElement(
            type: AvatarElementType.EYES, color: Colors.black, number: 0);
    this.face = face ??
        AvatarElement(
            type: AvatarElementType.FACE, color: Colors.black, number: 0);
    this.hair = hair ??
        AvatarElement(
            type: AvatarElementType.HAIR, color: Colors.black, number: 0);
    this.hat = hat ??
        AvatarElement(
            type: AvatarElementType.HAT, color: Colors.black, number: 0);
    this.mouth = mouth ??
        AvatarElement(
            type: AvatarElementType.MOUTH, color: Colors.black, number: 0);
  }

  late AvatarElement hat;
  late AvatarElement hair;
  late AvatarElement face;
  late AvatarElement eyes;
  late AvatarElement mouth;
  late AvatarElement clothes;

  factory AvatarSet.copy(AvatarSet copy) => AvatarSet(
      hat: AvatarElement.copy(copy.hat),
      hair: AvatarElement.copy(copy.hair),
      face: AvatarElement.copy(copy.face),
      eyes: AvatarElement.copy(copy.eyes),
      mouth: AvatarElement.copy(copy.mouth),
      clothes: AvatarElement.copy(copy.clothes));

  factory AvatarSet.fromJson(Map<String, dynamic> json) => AvatarSet(
      clothes: AvatarElement.fromJson(json['clothes']),
      eyes: AvatarElement.fromJson(json['eyes']),
      face: AvatarElement.fromJson(json['face']),
      hair: AvatarElement.fromJson(json['hair']),
      hat: AvatarElement.fromJson(json['hat']),
      mouth: AvatarElement.fromJson(json['mouth']));

  Map<String, dynamic> toJson() => {
        'clothes': clothes,
        'eyes': eyes,
        'face': face,
        'hair': hair,
        'hat': hat,
        'mouth': mouth
      };
}
