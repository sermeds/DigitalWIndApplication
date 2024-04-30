import "dart:convert";

import "package:digital_wind_application/API/httphelp.dart";
import "package:http/http.dart" as http;

void sendAnswers(int testId, List<String> answers, String token){
  http.post(buildUri("/api/tests/$testId"), body: const JsonEncoder().convert(answers), headers: {'Authentication': 'Bearer $token'});
}