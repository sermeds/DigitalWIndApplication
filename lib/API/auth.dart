import "dart:convert";
import "package:digital_wind_application/API/httphelp.dart";
import "package:digital_wind_application/models/dto/register_info.dart";
import "package:digital_wind_application/models/tokens.dart";
import "package:http/http.dart" as http;

Future<TokenTuple> authorize(String login, String password) {
  return http.post(buildUri("/api/authenticate"), body: {
    'login': login,
    'password': password
  }).then((res) => TokenTuple.fromJson(jsonDecode(res.body)));
}

Future<TokenTuple> register(RegisterInfo info) {
  return http
      .post(buildUri("/api/register"), body: jsonEncode(info))
      .then((res) => TokenTuple.fromJson(jsonDecode(res.body)));
}

Future<TokenTuple> refresh(String refreshToken) {
  return http
      .post(buildUri("/api/refresh"),
          body: jsonEncode({"refreshToken": refreshToken}))
      .then((res) => TokenTuple.fromJson(jsonDecode(res.body)));
}

Future<bool> findByLogin(String login) async {
  return http
      .get(buildUri("/api/findByLogin?login=$login"))
      .then((res) => res.body as bool);
}
