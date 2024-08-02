import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruitapp/Features/auth/presentation/view/signup_view.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:fruitapp/core/utils/text_styles.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        //text: 'Fruit ',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
              text: "لا تمتلك حساب؟",
              style: TextStyles.semibold16.copyWith(color: AppColors.grey600)),
          const TextSpan(
            text: " ",
          ),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, SignUpView.routeName);
                },
              text: "قم بإنشاء حساب",
              style: TextStyles.semibold16
                  .copyWith(color: AppColors.primaryColor)),
        ],
      ),
    );
  }
}
