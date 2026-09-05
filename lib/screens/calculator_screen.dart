import 'package:calculator_app/themes/app_colors.dart';
import 'package:calculator_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String lhs = '';
  String rhs = '';
  String savedOperator = '';
  String input = '';
  String? finalRes, errorText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment(1, 0),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${lhs} ${savedOperator}",
                      style: TextStyle(
                        fontSize: 30,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Text(
                      finalRes ?? errorText ?? input,
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      CustomButton(
                                        text: "Ac",
                                        buttonColor: AppColors.lightGrayColor,
                                        textColor: AppColors.whiteColor,
                                        fontSize: 20,
                                        onpressed: clearData,
                                      ),
                                      CustomButton(
                                        text: "7",
                                        onpressed: onDigitButtonClicked,
                                      ),
                                      CustomButton(
                                        text: "4",
                                        onpressed: onDigitButtonClicked,
                                      ),
                                      CustomButton(
                                        text: "1",
                                        onpressed: onDigitButtonClicked,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      CustomButton(
                                        icon: Icon(
                                          Icons.backspace_outlined,
                                          size: 24,
                                        ),
                                        buttonColor: AppColors.lightGrayColor,
                                        textColor: AppColors.whiteColor,
                                        onpressed: (p0) {
                                          if (input.isEmpty) return;
                                          input = input.substring(
                                            0,
                                            input.length - 1,
                                          );
                                          setState(() {});
                                        },
                                      ),
                                      CustomButton(
                                        text: "8",
                                        onpressed: onDigitButtonClicked,
                                      ),
                                      CustomButton(
                                        text: "5",
                                        onpressed: onDigitButtonClicked,
                                      ),
                                      CustomButton(
                                        text: "2",
                                        onpressed: onDigitButtonClicked,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      CustomButton(
                                        text: "/",
                                        buttonColor: AppColors.darkBlueColor,
                                        textColor: AppColors.whiteColor,
                                        onpressed: onOperatorClicked,
                                      ),
                                      CustomButton(
                                        text: "9",
                                        onpressed: onDigitButtonClicked,
                                      ),
                                      CustomButton(
                                        text: "6",
                                        onpressed: onDigitButtonClicked,
                                      ),
                                      CustomButton(
                                        text: "3",
                                        onpressed: onDigitButtonClicked,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CustomButton(
                                  flex: 2,
                                  text: "0",
                                  onpressed: onDigitButtonClicked,
                                ),
                                CustomButton(
                                  flex: 1,
                                  text: ".",
                                  onpressed: (String text) {
                                    if (input.contains(text)) {
                                      return;
                                    } else {
                                      onDigitButtonClicked(text);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomButton(
                            text: "*",
                            flex: 2,
                            buttonColor: AppColors.darkBlueColor,
                            textColor: AppColors.whiteColor,
                            onpressed: onOperatorClicked,
                          ),
                          CustomButton(
                            text: "-",
                            flex: 2,
                            buttonColor: AppColors.darkBlueColor,
                            textColor: AppColors.whiteColor,
                            onpressed: onOperatorClicked,
                          ),
                          CustomButton(
                            text: "+",
                            flex: 3,
                            buttonColor: AppColors.darkBlueColor,
                            textColor: AppColors.whiteColor,
                            onpressed: onOperatorClicked,
                          ),
                          CustomButton(
                            text: "=",
                            flex: 3,
                            buttonColor: AppColors.lightBlueColor,
                            textColor: AppColors.whiteColor,
                            onpressed: onEqualClicked,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDigitButtonClicked(String digit) {
    finalRes = errorText = null;
    input += digit;
    setState(() {});
  }

  void onOperatorClicked(String operator) {
    if (input.isEmpty) return;
    if (lhs.isEmpty) {
      lhs = input;
      savedOperator = operator;
    } else {
      rhs = input;
      lhs = calculate(lhs, savedOperator, rhs);
      rhs = '';
      savedOperator = operator;
    }
    input = '';
    setState(() {});
  }

  String calculate(String frist, String op, String sec) {
    late double res;
    switch (op) {
      case '+':
        res = double.parse(frist) + double.parse(sec);
      case '-':
        res = double.parse(frist) - double.parse(sec);
      case '*':
        res = double.parse(frist) * double.parse(sec);
      case '/':
        if (double.parse(sec) == 0) {
          errorText = "InValid";
          return '';
        }
        res = double.parse(frist) / double.parse(sec);
    }
    return res.toString();
  }

  onEqualClicked(String operator) {
    rhs = input;
    String res = calculate(lhs, savedOperator, rhs);
    if(errorText == null){
      finalRes = res;
    }
    lhs = rhs = savedOperator = input = '';
    setState(() {});
  }

  clearData(String _) {
    lhs = rhs = savedOperator = input = '';
    finalRes = errorText = null;
    setState(() {});
  }
}
