import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/core/costants/app_images.dart';
import 'package:app_p_10/presentation/ui/componets/app_bar.dart';
import 'package:app_p_10/presentation/ui/componets/app_button.dart';
import 'package:app_p_10/presentation/ui/componets/app_text.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double loanAmount;
  final double monthlyPayment;
  final double totalPayment;
  final double interestPayments;

  const ResultScreen({
    required this.loanAmount,
    required this.monthlyPayment,
    required this.totalPayment,
    required this.interestPayments,
    Key? key,
  }) : super(key: key);

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
          title: "Result",
          widgetOne: Image.asset(
            arrowBack,
            height: 16,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 57,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: AppTexts(
                  title: 'Loan amount',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: dilogTextColor,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AppTexts(
                    title: loanAmount.toInt().toString(),
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 27),
              Container(
                height: 347,
                width: 382,
                decoration: BoxDecoration(
                  color: textFieldColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const AppTexts(
                        title: 'Total payment amount',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: dilogTextColor,
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      AppTexts(
                        title: totalPayment.toInt().toString(),
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      const Divider(
                        height: 2,
                        color: dilogTextColor,
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      const AppTexts(
                        title: 'Interest payments',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: dilogTextColor,
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      AppTexts(
                        title: interestPayments.toInt().toString(),
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      const Divider(
                        height: 2,
                        color: dilogTextColor,
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      const AppTexts(
                        title: 'Monthly payment',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: dilogTextColor,
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      AppTexts(
                        title: monthlyPayment.toInt().toString(),
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: AppButton(
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
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
