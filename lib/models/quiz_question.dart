class QuizQuestion {
  const QuizQuestion(this.text, this.answers, this.score);

  final String text;
  final List<String> answers;
  final int score;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
