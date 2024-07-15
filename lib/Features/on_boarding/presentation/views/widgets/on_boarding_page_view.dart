import 'package:flutter/material.dart';
import 'package:fruitapp/Features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:fruitapp/core/utils/assets.dart';

import '../../../../../core/utils/text_styles.dart';

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.pageController,
      children: [
        PageViewItem(
            isVisible: true,
            image: Assets.assetsImagesOnboardingImage1,
            background: Assets.assetsImagesOnboardingBackground1,
            subtitle:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
            title: RichText(
              text: TextSpan(
                //text: 'Fruit ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  const TextSpan(
                      text: 'مرحبًا بك في ', style: TextStyles.bold23),
                  TextSpan(
                      text: 'Fruit',
                      style: TextStyles.bold23
                          .copyWith(color: AppColors.primaryColor)),
                  TextSpan(
                      text: ' HUb',
                      style:
                          TextStyles.bold23.copyWith(color: AppColors.orange)),
                ],
              ),
            )),
        PageViewItem(
            isVisible: false,
            image: Assets.assetsImagesOnboardingImage2,
            background: Assets.assetsImagesOnboardingBackground2,
            subtitle:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
            title: Text('ابحث وتسوق',
                style: TextStyles.bold23.copyWith(color: AppColors.textColor)))
      ],
    );
  }
}
