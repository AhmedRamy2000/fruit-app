import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitapp/Features/auth/presentation/view/manager/sign_in/signin_cubit.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/dont_have_an_account.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/or_divider.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/password_field.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/social_login_button.dart';
import 'package:fruitapp/core/constants.dart';
import 'package:fruitapp/core/helper/build_error_bar.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:fruitapp/core/utils/text_styles.dart';
import 'package:fruitapp/core/widgets/app_fields/custom_text_field.dart';
import 'package:fruitapp/core/widgets/custom_button.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late String email, password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: khorizontalPadding),
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTestFromField(
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => email = value!,
              ),
              const SizedBox(
                height: 24,
              ),
              PasswordField(
                onSaved: (value) => password = value!,
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
              BlocConsumer<SignInCubit, SignInState>(
                listener: (context, state) {
                  if (state is SignInFailure) {
                    buildErrorMessage(context, state.message);
                  }
                  if (state is SignInSuccess) {
                    Navigator.of(context).pop();
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        context.read<SignInCubit>().logInUser(email, password);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    isLoading: state is SignInLoading,
                    text: 'تسجيل دخول',
                    textStyle: TextStyles.bold16.copyWith(color: Colors.white),
                  );
                },
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
                onPressed: () => context.read<SignInCubit>().logInWithGoogle(),
              ),
              const SizedBox(
                height: 8,
              ),
              const SocialLoginButton(
                enable: false,
                image: 'assets/images/apple_icon.svg',
                label: 'تسجيل بواسطة أبل',
                // onPressed: () => context.read<SignInCubit>().logInWithApple(),
              ),
              const SizedBox(
                height: 8,
              ),
              SocialLoginButton(
                image: 'assets/images/facebook_icon.svg',
                label: "تسجيل بواسطة فيسبوك",
                onPressed: () =>
                    context.read<SignInCubit>().logInWithFacebook(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
