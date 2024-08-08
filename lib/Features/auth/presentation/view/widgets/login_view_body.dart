import 'package:flutter/material.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/dont_have_an_account.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/or_divider.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/social_login_button.dart';
import 'package:fruitapp/core/constants.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:fruitapp/core/utils/text_styles.dart';
import 'package:fruitapp/core/widgets/app_fields/custom_text_field.dart';
import 'package:fruitapp/core/widgets/custom_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
            const CustomTestFromField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 24,
            ),
            const CustomTestFromField(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: Icon(Icons.remove_red_eye, color: AppColors.iconColor),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyles.semibold13
                      .copyWith(color: AppColors.lightPrimaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
              onPressed: () {},
              text: 'تسجيل دخول',
              textStyle: TextStyles.bold16.copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 32,
            ),
            const DontHaveAnAccountWidget(),
            const SizedBox(
              height: 32,
            ),
            const OrDivider(),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              image: 'assets/images/google_icon.svg',
              label: 'تسجيل بواسطة جوجل',
              onPressed: () {},
            ),
             const SizedBox(
              height: 8,
            ),
            SocialLoginButton(
              image: 'assets/images/apple_icon.svg',
              label: 'تسجيل بواسطة أبل',
              onPressed: () {},
            ),
             const SizedBox(
              height: 8,
            ),
            SocialLoginButton(
              image: 'assets/images/facebook_icon.svg',
              label: "تسجيل بواسطة فيسبوك",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
