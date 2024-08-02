import 'package:flutter/material.dart';
import 'package:fruitapp/Features/auth/presentation/view/login_view.dart';
import 'package:fruitapp/core/constants.dart';
import 'package:fruitapp/core/services/shared_perferences_singleton.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.isVisible,
      required this.image,
      required this.background,
      required this.subtitle,
      required this.title});
  final String image, background;
  final String subtitle;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                  child: SvgPicture.asset(fit: BoxFit.fill, background)),
              Positioned(
                  bottom: 0, left: 0, right: 0, child: SvgPicture.asset(image)),
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    SPS.setBool(kisFirstVisit, true);
                    Navigator.of(context)
                        .pushReplacementNamed(LoginView.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'تخط',
                      style: TextStyles.regular13
                          .copyWith(color: AppColors.grey400),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        title,
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(subtitle,
              textAlign: TextAlign.center,
              style: TextStyles.semibold13.copyWith(color: AppColors.gray500)),
        )
      ],
    );
  }
}
