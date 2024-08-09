import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitapp/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruitapp/Features/auth/presentation/view/manager/sign_in/signin_cubit.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/signin_view_body.dart';
import 'package:fruitapp/core/services/get_it_services.dart';
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
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
          appBar: buildAppBar(context, 'تسجيل دخول'),
          body: const SignInViewBody()),
    );
  }
}
