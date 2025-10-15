class Quiz {
  List<Question> questions = [];
  List<Answer> addAnswer;
  Quiz(this.addAnswer, this.questions);

  int getScore() {
    int score = 0;
    for (var answer in addAnswer) {
      if (answer.isGoodAnswer()) {
        score++;
      }
    }
    return score;
  }
}

class Question {
  String title;
  List<String> choices = [];
  String goodChoice;
  Question({
    required this.title,
    required this.choices,
    required this.goodChoice,
  });
}

class Answer {
  String answerChoice;

  /// link each answer to its question
  Question question;
  Answer(this.answerChoice, this.question);

  /// true if the user selected the correct choice
  bool isGoodAnswer() {
    return answerChoice == question.goodChoice;
  }
}
