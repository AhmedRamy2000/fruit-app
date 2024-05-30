import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruitapp/Features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:fruitapp/core/utils/app_colors.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: OnBoardingPageView()),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
              activeColor: AppColors.primaryColor,
              color: AppColors.primaryColor.withOpacity(0.5)),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 8,
        )
      ],
    );
  }
}
