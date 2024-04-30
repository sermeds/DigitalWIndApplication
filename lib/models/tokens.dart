class TokenTuple{
  final String accessToken;
  final String refreshToken;

  const TokenTuple({required this.accessToken, required this.refreshToken});

  factory TokenTuple.fromJson(Map<String, String> json){
    return TokenTuple(accessToken: json["accessToken"]!, refreshToken: json["refreshToken"]!);
  }
}