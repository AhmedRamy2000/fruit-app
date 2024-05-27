import 'package:flutter/material.dart';
import 'package:fruitapp/core/utils/assets.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.assetsImagesPlant),
        ],
      ),
      SvgPicture.asset(Assets.assetsImagesLogo),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.assetsImagesSplashBottom),
        ],
      )
    ],);
  }
}