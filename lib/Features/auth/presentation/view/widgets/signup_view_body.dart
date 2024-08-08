import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitapp/Features/auth/presentation/view/manager/signup_cubit/signup_cubit.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/have_an_account.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/password_field.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/terms_and_conditions_widget.dart';
import 'package:fruitapp/core/constants.dart';
import 'package:fruitapp/core/helper/build_error_bar.dart';
import 'package:fruitapp/core/utils/text_styles.dart';
import 'package:fruitapp/core/widgets/app_fields/custom_text_field.dart';
import 'package:fruitapp/core/widgets/custom_button.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, userName, password;
  late bool isTermsAccepted = false;
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
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => userName = value!,
              ),
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
              TermsAndConditionsWidget(
                onChange: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(
                height: 32,
              ),
              BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpFailure) {
                    buildErrorMessage(context, state.failure);
                  }
                  if (state is SignUpSuccess) {
                    Navigator.of(context).pop();
                  }
                },
                builder: (context, state) {
                  return signUpCustomButton(context, state);
                },
              ),
              const SizedBox(
                height: 26,
              ),
              const HaveAnAccountWidget()
            ],
          ),
        ),
      ),
    );
  }

  CustomButton signUpCustomButton(BuildContext context, SignUpState state) {
    return CustomButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          if (isTermsAccepted) {
            context
                .read<SignUpCubit>()
                .createUserWithEmailAndPassword(email, password, userName);
          } else {
            buildErrorMessage(
                context, 'يجب الموافقة على الشروط والأحكام للاستمرار');
          }
        } else {
          setState(() {
            autovalidateMode = AutovalidateMode.always;
          });
        }
      },
      isLoading: state is SignUpLoading,
      text: 'إنشاء حساب جديد',
      textStyle: TextStyles.bold16.copyWith(color: Colors.white),
    );
  }
}
