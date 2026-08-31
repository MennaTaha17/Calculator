import 'package:calculator_app/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.flex = 1,
    super.key,
    this.text,
    this.buttonColor,
    this.textColor,
    this.fontSize,
    this.icon,
  });

  int flex;
  Color? buttonColor, textColor;
  String? text;
  double? fontSize;
  Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: FilledButton(
          onPressed: () {},
          style: FilledButton.styleFrom(
            backgroundColor: buttonColor ?? AppColors.grayColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child:
              icon ??
              Text(
                text ?? "",
                style: TextStyle(
                  color: textColor ?? AppColors.lightBlueColor,
                  fontSize: fontSize ?? 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
        ),
      ),
    );
  }
}
