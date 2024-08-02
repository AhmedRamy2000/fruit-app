import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruitapp/Features/auth/presentation/view/login_view.dart';
import 'package:fruitapp/Features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:fruitapp/core/constants.dart';
import 'package:fruitapp/core/services/shared_perferences_singleton.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:fruitapp/core/widgets/custom_buttom.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late PageController pageController;
  int currentPage = 0;

  @override
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: OnBoardingPageView(
          pageController: pageController,
        )),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
              activeColor: AppColors.primaryColor,
              color: currentPage == 1
                  ? AppColors.primaryColor
                  : AppColors.primaryColor.withOpacity(0.5)),
        ),
        const SizedBox(
          height: 16,
        ),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: khorizontalPadding),
            child: CustomButton(
              onPressed: () {
                SPS.setBool(kisFirstVisit, true);
                Navigator.of(context).pushReplacementNamed(LoginView.routeName);
              },
              text: 'ابدأ الان',
              textStyle: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),

        // SizedBox(
        //   height: MediaQuery.sizeOf(context).height / 8,
        // )
      ],
    );
  }
}
