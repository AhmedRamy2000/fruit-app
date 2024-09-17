import 'package:flutter/material.dart';
import 'package:fruitapp/Features/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:fruitapp/core/widgets/app_fields/search_text_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomHomeAppBar(),
              SizedBox(
                height: 16,
              ),
              SearchTextField()
            ],
          ),
        ),
      ],
    );
  }
}
