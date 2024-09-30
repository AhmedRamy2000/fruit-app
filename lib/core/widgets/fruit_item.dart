import 'package:flutter/material.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:fruitapp/core/utils/text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          )),
      child: Stack(
        children: [
          Positioned(
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_outline))),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset('assets/images/fruit_test.png'),
                SizedBox(
                  height: 24,
                ),
                ListTile(
                  title: const Text(
                    'فراولة',
                    style: TextStyles.semibold16,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '30 جنية',
                          style: TextStyles.bold13
                              .copyWith(color: AppColors.orange500),
                        ),
                        TextSpan(
                          text: ' /',
                          style: TextStyles.bold13
                              .copyWith(color: AppColors.orange500),
                        ),
                        TextSpan(
                          text: 'الكيلو',
                          style: TextStyles.semibold13
                              .copyWith(color: AppColors.orange500),
                        ),
                      ],
                    ),
                  ),
                  trailing: const CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
