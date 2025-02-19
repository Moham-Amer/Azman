import 'package:azman/core/theme/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return Container(
      width: 170.w,
      height: 40.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
          color: appColors.lighterBlueColor.withOpacity(0.4)),
      child: Center(
          child: Text(
        text.tr(),
        textAlign: TextAlign.center,
        style: AppTextStyle.f12W600White(context),
      )),
    );
  }
}
