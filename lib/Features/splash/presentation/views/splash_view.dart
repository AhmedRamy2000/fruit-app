import 'package:flutter/material.dart';
import 'package:fruitapp/Features/splash/presentation/views/widget/splash_view_body.dart';

class SplashView extends StatelessWidget {
  static const routeName = 'splash';
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody()
    );
  }
}