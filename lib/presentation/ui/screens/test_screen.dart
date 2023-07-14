import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/core/costants/app_images.dart';
import 'package:app_p_10/providers/test_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_p_10/presentation/ui/componets/app_bar.dart';
import 'package:app_p_10/presentation/ui/componets/app_text.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final testProvider = Provider.of<TestProvider>(context);

    if (testProvider.questionList.isEmpty) {
      testProvider.initialize();
    }
    Future<bool> onWillPop() async {
      return false;
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: containerTextColor,
          automaticallyImplyLeading: false,
          title: CustomAppBar(
            ontap: () {
              testProvider.moveToPreviousQuestion(context);
            },
            title: "Test",
            widgetOne: Image.asset(
              arrowBack,
              height: 16,
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              _questionWidget(testProvider),
              const SizedBox(
                height: 47,
              ),
              _answerList(testProvider, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _questionWidget(TestProvider quizProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 195,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: containerTextColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: AppTexts(
              title: quizProvider
                  .questionList[quizProvider.currentQuestionIndex].questionText,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _answerList(TestProvider quizProvider, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: quizcontainerColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 17, left: 16, right: 16),
        child: Column(
          children: [
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              children: quizProvider
                  .questionList[quizProvider.currentQuestionIndex].answersList
                  .map((answer) {
                return _answerButton(quizProvider, answer, context);
              }).toList(),
            ),
            const Spacer(),
            Container(
              height: 69,
              width: 116,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: imageBackgroundColor,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(18),
                  topEnd: Radius.circular(18),
                ),
              ),
              child: AppTexts(
                title:
                    " ${quizProvider.currentQuestionIndex + 1}/${quizProvider.questionList.length.toString()}",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _answerButton(
      TestProvider quizProvider, Answer answer, BuildContext context) {
    bool isSelected = answer == quizProvider.selectedAnswer;

    return GestureDetector(
      onTap: () {
        if (quizProvider.selectedAnswer == null) {
          quizProvider.setSelectedAnswer(answer, context);
        }

        Future.delayed(const Duration(milliseconds: 300), () {
          if (quizProvider.currentQuestionIndex <
              quizProvider.questionList.length - 1) {
            quizProvider.moveToNextQuestion(context);
          } else {
            _resultPage(quizProvider, context);
          }
        });
      },
      child: Container(
        width: 170,
        height: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? selectedcontainerColor : containerTextColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: AppTexts(
              height: 1.3,
              textalign: TextAlign.center,
              title: answer.answerText,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: isSelected ? textColor : inactivetextColor,
            ),
          ),
        ),
      ),
    );
  }

  void _resultPage(TestProvider quizProvider, BuildContext context) {
    final bool isPassed = quizProvider.isQuizPassed();
    final String score = quizProvider.score.toString();

    Future.delayed(Duration.zero, () {
      Navigator.pushNamed(context, "result_spage_test",
          arguments: {'isPassed': isPassed, 'score': score});

      quizProvider.resetQuiz();
    });
  }
}
