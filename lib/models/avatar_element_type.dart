enum AvatarElementType{
  HAT, HAIR, FACE, EYES, MOUTH, CLOTHES;

  factory AvatarElementType.fromJson(String json){
    switch(json){
      case "HAT":
        return AvatarElementType.HAT;
      case "HAIR":
        return AvatarElementType.HAIR;
      case "FACE":
        return AvatarElementType.FACE;
      case "EYES":
        return AvatarElementType.EYES;
      case "MOUTH":
        return AvatarElementType.MOUTH;
      case "CLOTHES":
        return AvatarElementType.CLOTHES;
      
      default:
        throw Exception("invalid type");
    }
  }

  String toJson(){
    switch(this){
      case AvatarElementType.HAT:
        return "HAT";
      case AvatarElementType.HAIR:
        return "HAIR";
      case AvatarElementType.FACE:
        return "FACE";
      case AvatarElementType.EYES:
        return "EYES";
      case AvatarElementType.MOUTH:
        return "MOUTH";
      case AvatarElementType.CLOTHES:
        return "CLOTHES";
      
      default:
        throw Exception("invalid type");
    }
  }
}