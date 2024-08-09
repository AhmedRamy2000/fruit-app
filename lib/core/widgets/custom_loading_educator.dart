import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingEducator extends StatelessWidget {
  const CustomLoadingEducator({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.inkDrop(
      color: Colors.white,
      size: 20,
    );
  }
}
