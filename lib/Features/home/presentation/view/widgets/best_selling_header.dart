import 'package:flutter/material.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:fruitapp/core/utils/text_styles.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(children: [
        Text('الأكثر مبيعًا',style: TextStyles.bold16),
        Spacer(),
        Text('المزيد',style: TextStyles.regular13.copyWith(color:AppColors.gray400Color)),
      ],),
    );
  }
}