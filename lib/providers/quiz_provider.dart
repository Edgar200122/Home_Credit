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

class QuizProvider with ChangeNotifier {
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
      "What is your credit score range?",
      [
        Answer("Excellent (750 or above)", 3),
        Answer("Good (700-749)", 2),
        Answer("Fair (650-699)", 1),
        Answer("Poor (below 650)", 0),
      ],
    ));

    list.add(Question(
      "How stable is your employment status?",
      [
        Answer("I have been with the same employer for over two years.", 3),
        Answer("I recently changed jobs but have a stable income.", 2),
        Answer("I am currently unemployed.", 1),
        Answer("I have a history of frequent job changes.", 0),
      ],
    ));

    list.add(Question(
      "What is your current debt-to-income ratio?",
      [
        Answer("Below 30%", 3),
        Answer("Between 30% and 40%", 2),
        Answer("Between 40% and 50% ", 1),
        Answer("Above 50%", 0),
      ],
    ));

    list.add(Question(
      "How much collateral do you have to offer?",
      [
        Answer("Significant collateral, such as a property or vehicle.", 3),
        Answer("Some collateral, such as savings or investments.", 2),
        Answer("Limited or no collateral.", 1),
        Answer("I'm not sure or don't have collateral.", 0),
      ],
    ));
    list.add(Question(
      "What is the purpose of the loan?",
      [
        Answer("Home purchase or improvement.", 3),
        Answer("Education or professional development.", 2),
        Answer("Debt consolidation.", 1),
        Answer(" Other personal expenses.", 0),
      ],
    ));
    list.add(Question(
      "How long have you been using credit?",
      [
        Answer("Over 5 years.", 3),
        Answer("Between 3 and 5 years.", 2),
        Answer("Less than 3 years.", 1),
        Answer("I don't have a credit history.", 0),
      ],
    ));
    list.add(Question(
      "How much do you need to borrow?",
      [
        Answer("A small amount (less than \$5,000).", 3),
        Answer("A moderate amount (between \$5,000 and \$20,000).", 2),
        Answer("A substantial amount (between \$20,000 and \$50,000).", 1),
        Answer("A large amount (over \$50,000).", 0),
      ],
    ));
    list.add(Question(
      "How many late payments have you had in the past year?",
      [
        Answer("None.", 3),
        Answer("1-2 late payments.", 2),
        Answer("3-5 late payments.", 1),
        Answer(" More than 5 late payments.", 0),
      ],
    ));
    list.add(Question(
      "Do you have a co-signer available?",
      [
        Answer("Yes, with excellent credit and stable income.", 3),
        Answer("Yes, with good credit and stable income.", 2),
        Answer("No, I don't have a co-signer.", 1),
        Answer("I'm not sure.", 0),
      ],
    ));
    list.add(Question(
      "How long have you been living at your current address?",
      [
        Answer("Over 5 years.", 3),
        Answer(" Between 3 and 5 years.", 2),
        Answer("Less than 3 years.", 1),
        Answer("I recently moved.", 0),
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
