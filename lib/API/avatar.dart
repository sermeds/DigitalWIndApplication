import "dart:convert";
import "package:digital_wind_application/API/httphelp.dart";
import "package:digital_wind_application/models/dto/avatar_element_dto.dart";
import "package:http/http.dart" as http;

Future createAvatar(List<AvatarElementDTO> elements, String token) {
  return http.post(buildUri("api/avatar/create"),
      body: jsonEncode(elements), headers: {"Authentication": 'Bearer $token'});
}

Future<List<AvatarElementDTO>> findAvatar(int id, String token) {
  return http.get(buildUri("api/avatar/find?id=$id"), headers: {
    "Authentication": 'Bearer $token'
  }).then((res) =>
      (jsonDecode(res.body) as List).map((e) => AvatarElementDTO.fromJson(e)).toList());
}
