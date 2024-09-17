import 'package:flutter/material.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:fruitapp/core/utils/assets.dart';
import 'package:fruitapp/core/utils/text_styles.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: Container(
          padding: const EdgeInsets.all(12),
          decoration: const ShapeDecoration(
              color: Color(0xffeef8ed), shape: OvalBorder()),
          child: SvgPicture.asset(Assets.notification),
        ),
        leading: Image.asset(Assets.profileImage),
        title: Text(
          'صباح الخير !..',
          textAlign: TextAlign.right,
          style: TextStyles.regular16.copyWith(color: AppColors.grey400),
        ),
        subtitle: Text(
          'أحمد رامي',
          textAlign: TextAlign.right,
          style: TextStyles.bold16,
        ));
  }
}
 