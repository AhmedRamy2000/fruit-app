 import 'package:flutter/material.dart';
import 'package:fruitapp/core/utils/text_styles.dart';

AppBar buildAppBar(context, title) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: TextStyles.bold19,
      ),
      leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios_new)),
      centerTitle: true,
    );
  }