import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_text_style.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
        required this.text,
        required this.onPressed,
        required this.buttonColor,
        required this.textColor});

  final Color buttonColor;
  final String text;
  final Function onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
      },
      color: buttonColor,
      minWidth: 328.w,
      height: 50.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        text.tr(),
        style: AppTextStyle.f14W500Black(context).copyWith(color: textColor),
      ),
    );
  }
}
