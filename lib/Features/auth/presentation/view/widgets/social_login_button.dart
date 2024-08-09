import 'package:flutter/material.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:fruitapp/core/utils/text_styles.dart';
import 'package:svg_flutter/svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key, required this.label, this.onPressed, required this.image,this.enable=true});
  final String label;
  final String image;
  final bool enable;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor:enable ? Colors.white: Colors.grey.withOpacity(0.4),
              shape: RoundedRectangleBorder(
                  side:const BorderSide(color: AppColors.dividerColor, width: 1),
                  borderRadius: BorderRadius.circular(16))),
          child: ListTile(
              visualDensity:
                  const VisualDensity(vertical: VisualDensity.minimumDensity),
              leading: SvgPicture.asset(image),
              title: Text(label,
                  textAlign: TextAlign.center,
                  style: TextStyles.semibold16
                      .copyWith(color: AppColors.textColor)))),
    );
  }
}
