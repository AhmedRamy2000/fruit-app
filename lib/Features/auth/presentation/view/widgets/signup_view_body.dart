import 'package:flutter/material.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/dont_have_an_account.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/have_an_account.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/or_divider.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/social_login_button.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/terms_and_conditions_widget.dart';
import 'package:fruitapp/core/constants.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:fruitapp/core/utils/text_styles.dart';
import 'package:fruitapp/core/widgets/app_fields/custom_text_field.dart';
import 'package:fruitapp/core/widgets/custom_buttom.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: khorizontalPadding),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            CustomTestFromField(
              hintText: 'الاسم كامل',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTestFromField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTestFromField(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon:
                  Icon(Icons.remove_red_eye, color: AppColors.iconColor),
            ),
            const SizedBox(
              height: 16,
            ),
            const TermsAndConditionsWidget(),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
              onPressed: () {},
              text: 'إنشاء حساب جديد',
              textStyle: TextStyles.bold16.copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 26,
            ),
            const HaveAnAccountWidget()
          ],
        ),
      ),
    );
  }
}
