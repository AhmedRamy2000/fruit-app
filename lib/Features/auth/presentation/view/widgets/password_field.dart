import 'package:flutter/material.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:fruitapp/core/widgets/app_fields/custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTestFromField(
      obscure: obscure,
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
      onSaved: widget.onSaved,
      suffixIcon: GestureDetector(
          onTap: () => setState(() {
                obscure = !obscure;
              }),
          child: obscure
              ? const Icon(Icons.visibility_off, color: AppColors.iconColor)
              : const Icon(Icons.remove_red_eye, color: AppColors.iconColor)),
    );
  }
}
