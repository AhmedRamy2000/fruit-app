import 'package:flutter/material.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/signup_view_body.dart';
import 'package:fruitapp/core/widgets/custom_app_bar.dart';

class SignUpView extends StatefulWidget {
  static const String routeName = "sign_up";
  const SignUpView({super.key});
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, 'حساب جديد'),
        body: const SignUpViewBody());
  }
}
