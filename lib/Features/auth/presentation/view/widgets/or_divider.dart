import 'package:flutter/material.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:fruitapp/core/utils/text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(color: AppColors.dividerColor)),
        SizedBox(
          width: 16,
        ),
        Text('أو', style: TextStyles.semibold16),
        SizedBox(
          width: 16,
        ),
    Expanded(child: Divider(color: AppColors.dividerColor))
      ],
    );
  }
}
