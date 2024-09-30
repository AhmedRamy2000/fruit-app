import 'package:flutter/material.dart';
import 'package:fruitapp/Features/home/presentation/view/widgets/best_salling_gride_view.dart';
import 'package:fruitapp/Features/home/presentation/view/widgets/best_selling_header.dart';
import 'package:fruitapp/Features/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:fruitapp/Features/home/presentation/view/widgets/featured_list.dart';
import 'package:fruitapp/core/widgets/app_fields/search_text_field.dart';
import 'package:fruitapp/core/widgets/fruit_item.dart';

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
              SearchTextField(),
              SizedBox(
                height: 16,
              ),
              FeaturedList(),
              BestSellingHeader(),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        BestSallingGrideView()
      ],
    );
  }
}
