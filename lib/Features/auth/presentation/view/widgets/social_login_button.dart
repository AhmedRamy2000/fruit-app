import 'package:flutter/material.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:fruitapp/core/utils/text_styles.dart';
import 'package:svg_flutter/svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key, required this.label, this.onPressed, required this.image});
  final String label;
  final String image;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
          onPressed: onPressed,
          child: ListTile(
              visualDensity:
                  VisualDensity(vertical: VisualDensity.minimumDensity),
              leading: SvgPicture.asset(image),
              title: Text(label,
                  textAlign: TextAlign.center,
                  style: TextStyles.semibold16
                      .copyWith(color: AppColors.textColor))),
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.dividerColor, width: 1),
                  borderRadius: BorderRadius.circular(16)))),
    );
  }
}
