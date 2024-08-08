import 'package:flutter/material.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.onPressed, required this.text, this.textStyle,this.isLoading=false});
  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 54,
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            onPressed: onPressed,
            child: isLoading
                ? LoadingAnimationWidget.inkDrop(
                    color: Colors.white,
                    size: 20,
                  )
                : Text(text, style: textStyle)));
  }
}
