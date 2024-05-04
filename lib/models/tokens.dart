class TokenTuple{
  final String accessToken;
  final String refreshToken;

  const TokenTuple({required this.accessToken, required this.refreshToken});

  factory TokenTuple.fromJson(Map<String, dynamic> json){
    return TokenTuple(accessToken: json["accessToken"]!, refreshToken: json["refreshToken"]!);
  }

  Map<String, dynamic> toJson() => {'accessToken': accessToken, 'refreshToken': refreshToken};
}