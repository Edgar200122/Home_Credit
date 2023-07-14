import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/core/costants/app_images.dart';
import 'package:app_p_10/presentation/ui/componets/app_bar.dart';
import 'package:app_p_10/presentation/ui/componets/app_text.dart';
import 'package:flutter/material.dart';

class AskedQuestions extends StatelessWidget {
  const AskedQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: containerTextColor,
        automaticallyImplyLeading: false,
        title: CustomAppBar(
          ontap: () {
            Navigator.pop(context);
          },
          title: "FAQ",
          widgetOne: Image.asset(
            arrowBack,
            height: 16,
          ),
        ),
      ),
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              AppTexts(
                title: "Frequently Asked Questions (FAQ)",
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 25,
              ),
              AppTexts(
                title: "What is the probability of getting a loan?",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 10,
              ),
              AppTexts(
                textalign: TextAlign.start,
                title:
                    "Our app offers a convenient loan calculator that allows you to input the loan amount, interest rate, and loan term. It will then compute your monthly payment, helping you plan your finances effectively.",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 20,
              ),
              AppTexts(
                textalign: TextAlign.start,
                title: "How can I calculate my monthly loan payment?",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 10,
              ),
              AppTexts(
                textalign: TextAlign.start,
                title:
                    "Our app features a quiz specifically designed to assess your probability of getting a loan. The quiz takes into account various factors and provides you with an estimation based on your responses.",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 20,
              ),
              AppTexts(
                textalign: TextAlign.start,
                title: "How does the loan probability quiz work?",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 10,
              ),
              AppTexts(
                textalign: TextAlign.start,
                title:
                    "The loan probability quiz in our app asks you a series of questions related to your financial situation, credit history, and other relevant factors. Based on your responses, it assesses your likelihood of getting a loan and provides you with an indication of your chances.",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 20,
              ),
              AppTexts(
                title: "Are the loan probability results accurate?",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 10,
              ),
              AppTexts(
                textalign: TextAlign.start,
                title:
                    "While the quiz aims to provide a reasonable estimate of your loan probability, it's important to note that it is not a definitive assessment. The results are based on general criteria and should not be considered a loan approval or rejection guarantee.",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 20,
              ),
              AppTexts(
                textalign: TextAlign.start,
                title:
                    "Is the app suitable for both personal and business loans?",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 10,
              ),
              AppTexts(
                textalign: TextAlign.start,
                title:
                    "Yes, the app's features and resources cater to personal and business loans. Whether you're seeking a loan for personal needs or your business, you can benefit from the app's loan probability quiz, loan calculator, and educational content.",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 20,
              ),
              AppTexts(
                textalign: TextAlign.start,
                title:
                    "Can I share the app's banking tips and resources with others?",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 10,
              ),
              AppTexts(
                textalign: TextAlign.start,
                title:
                    "Absolutely! Our app provides sharing functionality that allows you to share helpful banking tips and resources with your friends, family, or colleagues. You can easily spread financial knowledge and help others make informed decisions.",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
