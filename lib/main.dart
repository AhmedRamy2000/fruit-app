import 'package:flutter/material.dart';
import 'package:fruitapp/Features/splash/presentation/views/splash_view.dart';
import 'package:fruitapp/core/helper/on_generate_routes.dart';

void main() {
  runApp(const FruitApp());
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}