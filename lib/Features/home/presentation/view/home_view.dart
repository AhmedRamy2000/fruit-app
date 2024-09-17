import 'package:flutter/material.dart';
import 'package:fruitapp/Features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "home_view";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
