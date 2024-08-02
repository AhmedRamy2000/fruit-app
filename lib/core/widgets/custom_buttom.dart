import 'package:flutter/material.dart';
import 'package:fruitapp/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text,this.textStyle});
  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 54,
        child: TextButton(
            style:
                TextButton.styleFrom(backgroundColor: AppColors.primaryColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
            onPressed: onPressed,
            child: Text(text, style: textStyle)));
  }
}
