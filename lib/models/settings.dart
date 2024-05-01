class Settings{

  Settings();

  int theme = 0;

  factory Settings.fromJson(Map<String, dynamic> json){
    Settings s = Settings();
    s.theme = json["theme"];

    return s;
  }

  Map<String, dynamic> toJson() => {"theme": theme};
}