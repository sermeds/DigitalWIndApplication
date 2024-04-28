class Question{
  String content;
  List<String> answers;

  int rightAnswer;

  Question({required this.content, required this.answers, required this.rightAnswer}){
    if(rightAnswer >= answers.length) {
      throw Exception("Right answer out of range");
    }
  }
}