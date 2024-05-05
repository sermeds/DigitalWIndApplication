import "dart:convert";

import "package:digital_wind_application/API/httphelp.dart";
import "package:digital_wind_application/models/test.dart";
import "package:http/http.dart" as http;

Future<List<Test>> getTests(String token) {
  return http.get(buildUri("/api/tests"), headers: {
    'Authentication': 'Bearer $token'
  }).then((res) => (jsonDecode(res.body) as List)
      .map((test) => Test.fromJson(test))
      .toList());
}

Future<Test> getTest(int id, String token) {
  return http.get(buildUri("/api/test?testId=$id"), headers: {
    'Authentication': 'Bearer $token'
  }).then((res) => Test.fromJson(jsonDecode(res.body)));
}

Future sendAnswers(int testId, List<String> answers, String token) {
  return http.post(buildUri("/api/tests/$testId"),
      body: const JsonEncoder().convert(answers),
      headers: {'Authentication': 'Bearer $token'});
}
