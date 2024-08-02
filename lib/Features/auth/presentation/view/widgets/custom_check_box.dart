import 'package:flutter/material.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:svg_flutter/svg.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.isChecked, required this.onChecked});
  final bool isChecked;
  final ValueChanged<bool> onChecked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {onChecked(!isChecked);},
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: const Duration(milliseconds: 50),
        decoration: ShapeDecoration(
            color: isChecked ? AppColors.primaryColor : Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1.5,
                    color:
                        isChecked ? Colors.transparent : const Color(0xffdcdede)),
                borderRadius: BorderRadius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: isChecked?SvgPicture.asset('assets/images/Check.svg'): const SizedBox(),
        ),
      ),
    );
  }
}
