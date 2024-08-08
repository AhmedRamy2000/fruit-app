import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruitapp/Features/auth/presentation/view/widgets/custom_check_box.dart';
import 'package:fruitapp/core/utils/app_colors.dart';
import 'package:fruitapp/core/utils/text_styles.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onChange});
  final ValueChanged<bool> onChange;

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;
  bool showError = false;

  bool validate() {
    if (!isTermsAccepted) {
      setState(() {
        showError = true;
      });
      return false;
    }
    setState(() {
      showError = false;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomCheckBox(
              isChecked: isTermsAccepted,
              onChecked: (value) {
                isTermsAccepted = value;
                widget.onChange(value);
                setState(() {
                  showError = !value;
                });
              },
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                        style: TextStyles.semibold13
                            .copyWith(color: AppColors.grey600)),
                    const TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        text: 'الشروط والأحكام الخاصة بنا',
                        style: TextStyles.semibold13
                            .copyWith(color: AppColors.lightPrimaryColor)),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (showError)
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'يجب الموافقة على الشروط والأحكام للاستمرار',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
