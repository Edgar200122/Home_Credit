import 'dart:math';

import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/core/costants/app_images.dart';
import 'package:app_p_10/presentation/ui/componets/app_bar.dart';
import 'package:app_p_10/presentation/ui/componets/app_button.dart';
import 'package:app_p_10/presentation/ui/componets/app_text.dart';
import 'package:app_p_10/presentation/ui/componets/textField_calculator.dart';
import 'package:app_p_10/presentation/ui/screens/result_calculator.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  double _sliderValue1 = 0;
  double _sliderValue2 = 0;
  double _sliderValue3 = 0;
  final TextEditingController _textFieldController1 = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  final TextEditingController _textFieldController3 = TextEditingController();
  LoanDuration _selectedDuration = LoanDuration.day;

  @override
  void dispose() {
    _textFieldController1.dispose();
    _textFieldController2.dispose();
    _textFieldController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    void calculatePayments() {
      double loanAmount = double.tryParse(_textFieldController1.text) ?? 0.0;
      double loanDuration = _sliderValue2;
      double annualInterestRate = _sliderValue3;

      if (loanAmount == 0) {
        return;
      }

      double monthlyInterestRate = annualInterestRate / 12 / 100;
      double numberOfPayments = loanDuration * 12;

      double numerator =
          monthlyInterestRate * pow(1 + monthlyInterestRate, numberOfPayments);
      double denominator = pow(1 + monthlyInterestRate, numberOfPayments) - 1;

      double monthlyPayment = loanAmount * (numerator / denominator);
      double totalPayment = monthlyPayment * numberOfPayments;
      double interestPayments = totalPayment - loanAmount;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            loanAmount: loanAmount,
            monthlyPayment: monthlyPayment,
            totalPayment: totalPayment,
            interestPayments: interestPayments,
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: containerTextColor,
        automaticallyImplyLeading: false,
        title: CustomAppBar(
          ontap: () {
            Navigator.pop(context);
          },
          title: "Calculator",
          widgetOne: Image.asset(
            arrowBack,
            height: 16,
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            currentFocus.unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 39),
                  const AppTexts(
                    title: 'Loan amount',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: dilogTextColor,
                  ),
                  const SizedBox(height: 6),
                  CustomTextFieldCalculator(
                    suffixText: '',
                    controller: _textFieldController1,
                    onChanged: (newValue) {
                      setState(() {
                        _sliderValue1 = double.parse(newValue.toString());
                      });
                    },
                  ),
                  Slider(
                    thumbColor: sliderActiveColor,
                    activeColor: sliderActiveColor,
                    inactiveColor: inactiveSliderColor,
                    value: _sliderValue1,
                    min: 0,
                    max: 50000,
                    onChanged: (newValue) {
                      // setState(() {
                      //   _sliderValue1 = newValue;
                      //   _textFieldController1.text = newValue.toString();
                      // });
                      setState(() {
                        _sliderValue1 = newValue.roundToDouble();
                        if (_sliderValue1 % 1 == 0) {
                          _textFieldController1.text =
                              _sliderValue1.toInt().toString();
                        } else {
                          _textFieldController1.text = _sliderValue1.toString();
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const AppTexts(
                    title: 'Loan duration',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: dilogTextColor,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor: radioColor,
                        value: LoanDuration.day,
                        groupValue: _selectedDuration,
                        onChanged: (value) {
                          setState(() {
                            _selectedDuration = value as LoanDuration;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const AppTexts(
                        title: 'day',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: dilogTextColor,
                      ),
                      Radio(
                        activeColor: radioColor,
                        value: LoanDuration.month,
                        groupValue: _selectedDuration,
                        onChanged: (value) {
                          setState(() {
                            _selectedDuration = value as LoanDuration;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const AppTexts(
                        title: 'months',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: dilogTextColor,
                      ),
                    ],
                  ),
                  CustomTextFieldCalculator(
                    controller: _textFieldController2,
                    onChanged: (newValue) {
                      setState(() {
                        _sliderValue2 = double.parse(newValue.toString());
                      });
                    },
                    suffixText: _selectedDuration == LoanDuration.day
                        ? 'day'
                        : 'months',
                  ),
                  Slider(
                    thumbColor: sliderActiveColor,
                    activeColor: sliderActiveColor,
                    inactiveColor: inactiveSliderColor,
                    value: _sliderValue2,
                    min: 0,
                    max: _selectedDuration == LoanDuration.day ? 365 : 36,
                    onChanged: (newValue) {
                      setState(() {
                        _sliderValue2 = newValue.roundToDouble();
                        if (_sliderValue2 % 1 == 0) {
                          _textFieldController2.text =
                              _sliderValue2.toInt().toString();
                        } else {
                          _textFieldController2.text = _sliderValue2.toString();
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      children: [
                        const AppTexts(
                          title: '1',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: dilogTextColor,
                        ),
                        const Spacer(),
                        AppTexts(
                          title: _textFieldController2.text.isNotEmpty
                              ? _textFieldController2.text
                              : '0',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: dilogTextColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const AppTexts(
                    title: 'Loan amount',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: dilogTextColor,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  CustomTextFieldCalculator(
                    controller: _textFieldController3,
                    onChanged: (newValue) {
                      setState(() {
                        _sliderValue3 = double.parse(newValue.toString());
                      });
                    },
                    suffixText: '% per annum',
                  ),
                  Slider(
                    thumbColor: sliderActiveColor,
                    activeColor: sliderActiveColor,
                    inactiveColor: inactiveSliderColor,
                    value: _sliderValue3,
                    min: 0,
                    max: 100,
                    onChanged: (newValue) {
                      setState(() {
                        _sliderValue3 = newValue.roundToDouble();
                        if (_sliderValue3 % 1 == 0) {
                          _textFieldController3.text =
                              _sliderValue3.toInt().toString();
                        } else {
                          _textFieldController3.text = _sliderValue3.toString();
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      children: [
                        const AppTexts(
                          title: '1',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: dilogTextColor,
                        ),
                        const Spacer(),
                        AppTexts(
                          title: _textFieldController3.text.isNotEmpty
                              ? _textFieldController3.text
                              : '0',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: dilogTextColor,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 70,
                      right: 40,
                      left: 40,
                      bottom: 35,
                    ),
                    child: AppButton(
                      widget: const Center(
                        child: AppTexts(
                          title: 'Calculate',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: containerTextColor,
                        ),
                      ),
                      width: 300,
                      ontap: calculatePayments,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum LoanDuration { day, month }
