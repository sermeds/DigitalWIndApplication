import 'package:digital_wind_application/models/question.dart';

class Test {
  Test({required this.title, required this.questions});

  String title;

  List<Question> questions;

  int? percent;
}