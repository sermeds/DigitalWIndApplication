enum PlayerSex{
  MALE, FEMALE;

  factory PlayerSex.fromJson(String json){
    switch (json){
      case "MALE":
        return PlayerSex.MALE;
      case "FEMALE":
        return PlayerSex.FEMALE;
      
      default:
        throw Exception('invalid sex');
    }
  }

  String toJson(){
    switch(this){
      case PlayerSex.MALE:
        return "MALE";
      case PlayerSex.FEMALE:
        return "FEMALE";
    }
  }
}