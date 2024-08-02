import 'package:flutter/material.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/login_view_body.dart';
import 'package:fruitapp/core/widgets/custom_app_bar.dart';

class LoginView extends StatefulWidget {
  static const String routeName = "log_in";
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, 'تسجيل دخول'),
        body: const LoginViewBody());
  }

 
}
