class Quiz {
  List<Question> questions = [];
  List<Answer> Answers = [];
  Quiz({required this.questions});

  int getScore() {
    int score = 0;
    for (var answer in Answers) {
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

main() {
  // Quiz country = Quiz(["what is the best country?"], []);
  Question q1 = Question(
    title: "country",
    choices: ["England", "cambodia"],
    goodChoice: "Cambodia",
  );
  Question q2 = Question(
    title: "country",
    choices: ["Maxico", "USA"],
    goodChoice: "USA",
  );

  var quiz = Quiz(questions: [q1, q2]);
  Answer player1a1 = Answer("Cambodia", q1);
  Answer player1a2 = Answer("USA", q2);

  quiz.Answers.add(player1a1);
  quiz.Answers.add(player1a2);
  
  print("${player1a2.isGoodAnswer()} && ${player1a1.isGoodAnswer()}");
  print("\nscore: ${quiz.getScore()}/ ${quiz.questions.length}");
}
