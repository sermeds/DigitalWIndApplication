class Question {
  String content;
  List<String> answers;

  int rightAnswer;

  Question(
      {required this.content,
      required this.answers,
      required this.rightAnswer}) {
    if (rightAnswer >= answers.length) {
      throw Exception("Right answer out of range");
    }
  }

  factory Question.fromJson(Map<String, dynamic> json) => Question(
      content: json['content'],
      answers: (json['answers'] as List).map((e) => e as String).toList(),
      rightAnswer: json['rightAnswer']);

  Map<String, dynamic> toJson() =>
      {"content": content, "answers": answers, "rightAnswer": rightAnswer};
}
