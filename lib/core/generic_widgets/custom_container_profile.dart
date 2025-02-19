import 'package:azman/core/constants/app_images.dart';
import 'package:azman/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_colors.dart';

class CustomContainerProfile extends StatelessWidget {
  CustomContainerProfile(
      {super.key, required this.imagePath, required this.text});

  String text;
  String imagePath;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return Column(
      children: [
        Container(
            width: 342.w,
            height: 27.h,
            child: Row(children: [
              SvgPicture.asset(
                imagePath,
                width: 24.w,
                height: 24.h,
                color:appColors.whiteColor
              ),
              SizedBox(
                width: 16.w,
              ),
              Text(text,style: AppTextStyle.f18W400White(context),),
              Spacer(),
              SvgPicture.asset(
                AppImages.arrowRight,
                width: 14.w,
                height: 14.h,
                  color:appColors.whiteColor
              )
            ])),
        SizedBox(
          height: 12.h,
        ),
        Container(
          width: 342.w,
          height: 0.h,
          color: Color(0xFFFFFFFF),
        ),
        SizedBox(
          height: 12.h,
        ),
      ],
    );
  }
}
