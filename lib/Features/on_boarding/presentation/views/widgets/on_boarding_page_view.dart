import 'package:flutter/material.dart';
import 'package:fruitapp/Features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:fruitapp/core/utils/app_styles.dart';
import 'package:fruitapp/core/utils/assets.dart';

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({super.key});

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
            image: Assets.assetsImagesOnboardingImage1,
            background: Assets.assetsImagesOnboardingBackground1,
            subtitle:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
            title: RichText(
              text: TextSpan(
                //text: 'Fruit ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: 'مرحبًا بك في ',
                      style: AppStyles.header
                          .copyWith(fontSize: 23, color: AppColors.textColor)),
                  TextSpan(
                      text: 'Fruit',
                      style: AppStyles.header.copyWith(
                          fontSize: 23, color: AppColors.primaryColor)),
                  TextSpan(
                      text: ' HUb',
                      style: AppStyles.header
                          .copyWith(fontSize: 23, color: AppColors.orange)),
                ],
              ),
            )),
        PageViewItem(
            image: Assets.assetsImagesOnboardingImage2,
            background: Assets.assetsImagesOnboardingBackground2,
            subtitle:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
            title: Text('ابحث وتسوق',
                style: AppStyles.header
                    .copyWith(fontSize: 23, color: AppColors.textColor)))
      ],
    );
  }
}
