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
    this.onpressed
  });

final int flex;
final Color? buttonColor, textColor;
final String? text;
final double? fontSize;
final Widget? icon;
final void Function(String)? onpressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: FilledButton(
          onPressed: () => onpressed!(text??""),
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
