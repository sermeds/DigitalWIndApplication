import 'dart:convert';

const _codec = Base64Codec();

Map<String, dynamic> parseToken(String token) {
  Match m = RegExp(r'(?<=\.)\w+(?=\.)').allMatches(token).toList()[0];

  String base64 = m[0]!;

  base64 = _codec.normalize(base64);

  return jsonDecode(String.fromCharCodes(_codec.decode(base64)));
}
