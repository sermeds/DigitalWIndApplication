import 'package:digital_wind_application/models/question.dart';
import 'package:digital_wind_application/utils/test_difficulty.dart';

class Test {
  Test({required this.title, required this.difficulty, required this.questions});

  String title;

  List<Question> questions;

  int? percent;

  Difficulty difficulty;
}