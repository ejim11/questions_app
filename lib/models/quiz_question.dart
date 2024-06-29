// the quiz question class model for creating quiz question object
class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // creating a copy of the question answers
    final shuffledList = List.of(answers);

    // shuffling the question answers
    shuffledList.shuffle();
    return shuffledList;
  }
}
