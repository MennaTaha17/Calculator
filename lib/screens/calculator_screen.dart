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
  String operator = '';
  String input = '';
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
                child: Text(
                  input,
                  style: TextStyle(fontSize: 50, color: AppColors.whiteColor),
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
                                      ),
                                      CustomButton(text: "7",onpressed: onDigitButtonClicked,),
                                      CustomButton(text: "4",onpressed: onDigitButtonClicked,),
                                      CustomButton(text: "1",onpressed: onDigitButtonClicked,),
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
                                      ),
                                      CustomButton(text: "8",onpressed: onDigitButtonClicked,),
                                      CustomButton(text: "5",onpressed: onDigitButtonClicked,),
                                      CustomButton(text: "2",onpressed: onDigitButtonClicked,),
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
                                      ),
                                      CustomButton(text: "9",onpressed: onDigitButtonClicked,),
                                      CustomButton(text: "6",onpressed: onDigitButtonClicked,),
                                      CustomButton(text: "3",onpressed: onDigitButtonClicked,),
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
                                CustomButton(flex: 2, text: "0",onpressed: onDigitButtonClicked,),
                                CustomButton(flex: 1, text: ".",onpressed: onDigitButtonClicked,),
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
                          ),
                          CustomButton(
                            text: "-",
                            flex: 2,
                            buttonColor: AppColors.darkBlueColor,
                            textColor: AppColors.whiteColor,
                          ),
                          CustomButton(
                            text: "+",
                            flex: 3,
                            buttonColor: AppColors.darkBlueColor,
                            textColor: AppColors.whiteColor,
                          ),
                          CustomButton(
                            text: "=",
                            flex: 3,
                            buttonColor: AppColors.lightBlueColor,
                            textColor: AppColors.whiteColor,
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
  onDigitButtonClicked(String digit){
    input += digit;
    setState(() {});
  }
}
