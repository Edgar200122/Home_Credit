import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/core/costants/app_images.dart';
import 'package:app_p_10/presentation/ui/componets/app_bar.dart';
import 'package:app_p_10/presentation/ui/componets/app_button.dart';
import 'package:app_p_10/presentation/ui/componets/app_text.dart';
import 'package:flutter/material.dart';

class ResultScreenTest extends StatelessWidget {
  const ResultScreenTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String score = arguments['score'] as String;

    // double percentage = 0.0;
    // if (score.isNotEmpty) {
    //   final int scoreValue = int.tryParse(score) ?? 0;
    //   percentage = (scoreValue / 30) * 100;
    // }
    // ignore: unused_local_variable
    String resultText = '';
    String percentageText = '';
    if (int.parse(score) >= 26) {
      percentageText = '90%';
      resultText =
          'Based on the information you provided, you have a high probability, around 90%, of being approved for a loan. However, please remember that this is just an estimation, and the final decision will depend on the specific criteria set by the lender.';
    } else if (int.parse(score) >= 20) {
      percentageText = '70%';
      resultText =
          'In light of the information provided in the test, your chances of obtaining a loan areapproximately 70%. However, it\'s essential to remember that this is only anapproximation, and the ultimate decision will be influenced by various factors determinedby the lender.';
    } else if (int.parse(score) >= 10) {
      percentageText = '50%';
      resultText =
          'According to the information gathered from the test, your chances of securing a loan are approximately 50%. However, it is crucial to remember that this is merely an estimation, and the ultimate decision will be influenced by various factors determined by the lender';
    } else {
      percentageText = '20%';
      resultText =
          'Based on the information in the test, your chances of obtaining a loan are approximately 20%. However, please remember that this is only an estimate, and the final decision will depend on various factors determined by the lender.';
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
            ontap: () {},
            title: "Result",
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 511,
                    width: 382,
                    decoration: BoxDecoration(
                      color: quizcontainerColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 37),
                        const AppTexts(
                          textalign: TextAlign.center,
                          title: "The result \nof your answers",
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 204,
                          width: 183,
                          decoration: BoxDecoration(
                            color: containerTextColor,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 26),
                              Image.asset(
                                percentIcon,
                                width: 79,
                              ),
                              const SizedBox(height: 14),
                              const AppTexts(
                                textalign: TextAlign.center,
                                title: "The probability of\ngetting a loan is:",
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              const SizedBox(height: 5),
                              AppTexts(
                                textalign: TextAlign.center,
                                title: percentageText,
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: Container(
                            alignment: Alignment.center,
                            height: 135,
                            width: 338,
                            decoration: BoxDecoration(
                              color: containerTextColor,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: AppTexts(
                              title: resultText,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 19,
                ),
                AppButton(
                  ontap: () {
                    Navigator.pushNamed(context, 'webview_page');
                  },
                  width: 300,
                  widget: const Center(
                    child: AppTexts(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      title: "Apply for a loan",
                      color: containerTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
