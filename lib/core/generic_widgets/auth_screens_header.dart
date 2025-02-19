import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_images.dart';
import '../theme/app_text_style.dart';

class AuthScreensHeader extends StatelessWidget {
  const AuthScreensHeader({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 55.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 24.w,
            ),
            SizedBox(
              width: 20.w,
              height: 20.h,
              child: SvgPicture.asset(AppImages.logo),
            ),
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
              width: 120.w,
              height: 20.h,
              child: SizedBox(
                child: SvgPicture.asset(AppImages.azman),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 24.w,
            ),
            Text(
              firstText.tr(),
              style: AppTextStyle.f32W700White(context)
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 24.w,
            ),
            SizedBox(
              width: 235.w,
              child: Text(
                secondText.tr(),
                style: AppTextStyle.f12W400White(context),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
      ],
    );
  }
}
