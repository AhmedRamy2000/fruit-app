import 'package:flutter/material.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:fruitapp/core/utils/assets.dart';
import 'package:fruitapp/core/utils/text_styles.dart';
import 'package:svg_flutter/svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0x0a000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0)
      ]),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'ابحث عن.......',
          hintStyle: TextStyles.regular13.copyWith(color: AppColors.grey400),
          filled: true,
          fillColor: Colors.white,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
          prefixIcon: SizedBox(
              width: 20,
              child: Center(
                  child: SvgPicture.asset(
                Assets.searchIcon,
              ))),
          suffixIcon: SizedBox(
              width: 20,
              child: Center(
                  child: SvgPicture.asset(
                Assets.filter,
              ))),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: Colors.white));
  }
}
