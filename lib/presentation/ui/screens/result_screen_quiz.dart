import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/core/costants/app_images.dart';
import 'package:app_p_10/presentation/ui/componets/app_bar.dart';
import 'package:app_p_10/presentation/ui/componets/app_button.dart';
import 'package:app_p_10/presentation/ui/componets/app_text.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String score = arguments['score'] as String;

    String resultText = '';
    String percentageText = '';
    if (int.parse(score) >= 26) {
      resultText =
          'Based on the information from your test, it seems that your chances of getting a loan may be around 90%. It\'s important to note that this is just an estimate and the final decision will depend on various factors determined by the lender.';
      percentageText = '90%';
    } else if (int.parse(score) >= 20) {
      resultText =
          'Based on the information from your test, it seems that your chances of getting a loan may be around 70%. It\'s important to note that this is just an estimate and the final decision will depend on various factors determined by the lender.';
      percentageText = '70%';
    } else if (int.parse(score) >= 10) {
      resultText =
          'Based on the information from your test, it seems that your chances of getting a loan may be around 50%. It\'s important to note that this is just an estimate and the final decision will depend on various factors determined by the lender.';
      percentageText = '50%';
    } else {
      resultText =
          'Based on the information from your test, it seems that your chances of getting a loan may be around 20%. It\'s important to note that this is just an estimate and the final decision will depend on various factors determined by the lender.';
      percentageText = '20%';
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
                    height: 474,
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
                                title: "You answered\ncorrectly",
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
                          height: 65,
                        ),
                        AppButton(
                          ontap: () {
                            Navigator.pushNamed(context, 'home_page');
                          },
                          width: 300,
                          widget: const Center(
                            child: AppTexts(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              title: "Menu",
                              color: containerTextColor,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
