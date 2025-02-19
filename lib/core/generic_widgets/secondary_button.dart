import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_text_style.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.buttonColor,
      required this.textColor,
      required this.image});

  final Color buttonColor;
  final String text;
  final Function onPressed;
  final Color textColor;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        color: buttonColor,
        minWidth: 327.w,
        height: 47.36.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 77.w,
            ),
            SvgPicture.asset(
              image,
              width: 17.w,
              height: 17.h,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              text.tr(),
              style: AppTextStyle.f14W600Black(context)
                  .copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
