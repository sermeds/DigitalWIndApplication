import "dart:convert";

import "package:digital_wind_application/API/httphelp.dart";
import "package:http/http.dart" as http;

void sendAnswers(int testId, List<String> answers){
  http.post(buildUri("/api/tests/$testId"), body: JsonEncoder().convert(answers));
}