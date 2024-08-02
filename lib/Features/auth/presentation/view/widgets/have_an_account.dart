import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:fruitapp/core/utils/text_styles.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
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
              text: 'تمتلك حساب بالفعل؟',
              style: TextStyles.semibold16.copyWith(color: AppColors.grey600)),
          const TextSpan(
            text: " ",
          ),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pop(context);
                },
              text: 'تسجيل دخول',
              style: TextStyles.semibold16
                  .copyWith(color: AppColors.primaryColor)),
        ],
      ),
    );
  }
}
