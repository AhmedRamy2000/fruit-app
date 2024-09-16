import 'package:flutter/material.dart';
import 'package:fruitapp/Features/auth/presentation/view/login_view.dart';
import 'package:fruitapp/Features/auth/presentation/view/signup_view.dart';
import 'package:fruitapp/Features/home/presentation/view/home_view.dart';
import 'package:fruitapp/Features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruitapp/Features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
