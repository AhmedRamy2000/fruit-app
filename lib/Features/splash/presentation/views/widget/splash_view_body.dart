import 'package:flutter/material.dart';
import 'package:fruitapp/Features/auth/presentation/view/login_view.dart';
import 'package:fruitapp/Features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruitapp/core/constants.dart';
import 'package:fruitapp/core/services/shared_perferences_singleton.dart';
import 'package:fruitapp/core/utils/assets.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    excuteNaviagtion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.assetsImagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.assetsImagesLogo),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.assetsImagesSplashBottom),
          ],
        )
      ],
    );
  }

  void excuteNaviagtion() {
    bool isFirstVisit = SPS.getBool(kisFirstVisit);
    Future.delayed(const Duration(seconds: 1), () {
      if (isFirstVisit) {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
