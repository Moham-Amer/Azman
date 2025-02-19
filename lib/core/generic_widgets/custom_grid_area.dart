import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_images.dart';
import '../constants/app_strings.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class CustomGridArea extends StatelessWidget {
  const CustomGridArea(
      {super.key,
      required this.image,
      required this.title,
      required this.isRating});

  final String image;
  final String title;
  final bool isRating;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return Container(
      width: 169.w,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [
                  appColors.blackColor.withOpacity(0),
                  appColors.blackColor.withOpacity(0.6000000238418579)
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title.tr(),
                        style: AppTextStyle.f16W700White(context),
                      ),
                      SizedBox(
                        height: 16.h,
                      )
                    ],
                  ),
                  SizedBox(
                    width:19.w ,
                  ),
                  Visibility(
                   visible: isRating,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppImages.star,
                              width: 10.w,
                              height: 10.h,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              AppStrings.rating.tr(),
                              style: AppTextStyle.f10W700White(context),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
