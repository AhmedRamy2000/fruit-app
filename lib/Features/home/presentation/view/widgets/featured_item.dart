import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruitapp/Features/home/presentation/view/widgets/featured_item_button.dart';
import 'package:fruitapp/core/utils/assets.dart';
import 'package:fruitapp/core/utils/text_styles.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: AspectRatio(
            aspectRatio: 342 / 158,
            child: Stack(
              children: [
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: MediaQuery.sizeOf(context).width * 0.4,
                    child:
                        Image.asset(Assets.imageGrapesTest, fit: BoxFit.fill)),
                Container(
                  width: MediaQuery.sizeOf(context).width / 2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: svg.Svg('assets/images/ellipse.svg'),
                          fit: BoxFit.fill)),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 33),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'عروض العيد',
                          style: TextStyles.regular13
                              .copyWith(color: Colors.white),
                        ),
                        const Spacer(),
                        Text(
                          'خصم 25%',
                          style:
                              TextStyles.bold19.copyWith(color: Colors.white),
                        ),
                        const Spacer(),
                        const SizedBox(
                          height: 11,
                        ),
                        FeaturedItemButton(
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: 29,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
