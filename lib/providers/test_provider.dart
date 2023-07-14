import 'package:flutter/material.dart';

class Answer {
  final String answerText;
  final int score;

  Answer(this.answerText, this.score);
}

class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class TestProvider with ChangeNotifier {
  List<Question> questionList = [];
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  void initialize() {
    questionList = getQuestions();
  }

  List<Question> getQuestions() {
    List<Question> list = [];

    list.add(Question(
      "What range does your credit score fall into?",
      [
        Answer("Exceptional (750 or higher)", 3),
        Answer("Positive (700-749)", 2),
        Answer("Average (650-699)", 1),
        Answer("Low (below 650)", 0),
      ],
    ));

    list.add(Question(
      "How secure is your current employment situation?",
      [
        Answer(
            "I have maintained the same employer for more than two years", 3),
        Answer(
            "I have recently switched jobs but have a consistent source of income",
            2),
        Answer("I am presently without employment", 1),
        Answer("I have a record of frequent job transitions", 0),
      ],
    ));

    list.add(Question(
      "What is the ratio between your current debt and income?",
      [
        Answer("Less than 30%", 3),
        Answer("Between 30% and 40%", 2),
        Answer("Between 40% and 50% ", 1),
        Answer("Above 50%", 0),
      ],
    ));

    list.add(Question(
      "What is the extent of collateral you can provide?",
      [
        Answer("Substantial collateral, such as real estate or a vehicle", 3),
        Answer("Some collateral, such as savings or investments", 2),
        Answer("Limited or no collateral", 1),
        Answer("Uncertain or lacking collateral", 0),
      ],
    ));
    list.add(Question(
      "What is the intended use of the loan?",
      [
        Answer("Acquiring or enhancing a residential property", 3),
        Answer("Education or career advancement", 2),
        Answer("Consolidating debt", 1),
        Answer("Miscellaneous personal expenditures", 0),
      ],
    ));
    list.add(Question(
      "For how long have you been utilizing credit?",
      [
        Answer("More than 5 years", 3),
        Answer("Between 3 and 5 years", 2),
        Answer("Less than 3 years", 1),
        Answer("I have no credit history", 0),
      ],
    ));
    list.add(Question(
      "What is the desired loan amount?",
      [
        Answer("A minor sum (below \$5,000)", 3),
        Answer("A moderate sum (between \$5,000 and \$20,000)", 2),
        Answer("A significant sum (between \$20,000 and \$50,000)", 1),
        Answer("A substantial sum (over \$50,000)", 0),
      ],
    ));
    list.add(Question(
      "How many instances of delayed payments have occurred within the last year?",
      [
        Answer("None.", 3),
        Answer("1-2 late payments", 2),
        Answer("3-5 late payments", 1),
        Answer(" More than 5 late payments", 0),
      ],
    ));
    list.add(Question(
      "Do you have the option of a co-signer?",
      [
        Answer("Yes, someone with exceptional credit and a steady income", 3),
        Answer("Yes, someone with good credit and a stable income", 2),
        Answer("No, I do not have a co-signer", 1),
        Answer("I am uncertain", 0),
      ],
    ));
    list.add(Question(
      "For how long have you resided at your present address?",
      [
        Answer("More than 5 years", 3),
        Answer("Between 3 and 5 years", 2),
        Answer(" Less than 3 years", 1),
        Answer("I have recently relocated", 0),
      ],
    ));

    return list;
  }

  void setSelectedAnswer(Answer answer, BuildContext context) {
    if (selectedAnswer != null) {
      score -= selectedAnswer!.score;
    } else if (selectedAnswer == answer) {
      selectedAnswer = null;
      notifyListeners();
      return;
    }

    selectedAnswer = answer;
    score += answer.score;
    notifyListeners();
  }

  void moveToNextQuestion(BuildContext context) {
    if (currentQuestionIndex < questionList.length - 1) {
      currentQuestionIndex++;
      selectedAnswer = null;
      notifyListeners();
    }
  }

  void moveToPreviousQuestion(BuildContext context) {
    if (currentQuestionIndex > 0) {
      if (selectedAnswer != null) {
        score -= selectedAnswer!.score;
        selectedAnswer = null;
      } else {
        score -= questionList[currentQuestionIndex].answersList[0].score;
      }
      currentQuestionIndex--;
      notifyListeners();
    } else {
      Navigator.pop(context);
    }
  }

  bool isQuizPassed() {
    return score >= questionList.length * 0.6;
  }

  void incrementScore() {
    score++;
  }

  void resetQuiz() {
    currentQuestionIndex = 0;
    score = 0;
    selectedAnswer = null;
    notifyListeners();
  }
}
