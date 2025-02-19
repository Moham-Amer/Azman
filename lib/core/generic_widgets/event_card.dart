import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_images.dart';
import '../constants/app_strings.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.appColors,
    required this.firstText,
    required this.secondText,
    required this.date,
    required this.image,
    required this.isJoin,
  });

  final CustomColors appColors;
  final String firstText;
  final String secondText;
  final String date;
  final String image;
  final bool isJoin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: ShapeDecoration(
          color: appColors.whiteColor.withOpacity(0.10000000149011612),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          children: [
            Container(
              width: 100.w,
              height: 128.h,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
              ),
            ),
            Container(
              width: 240.w,
              height: 125.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    firstText.tr(),
                    style: AppTextStyle.f16W700White(context),
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Text(
                      secondText.tr(),
                      style: AppTextStyle.f12W400White(context),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      Opacity(
                        opacity: 0.6,
                        child: Row(
                          children: [
                            SvgPicture.asset(AppImages.booking),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              date.tr(),
                              style: AppTextStyle.f10W700White(context),
                            ),
                            SizedBox(
                              width: 18.w,
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isJoin,
                        child: Container(
                          width: 36.w,
                          height: 24.h,
                          decoration: ShapeDecoration(
                            color: appColors.amberColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              AppStrings.join.tr(),
                              style: AppTextStyle.f10W700White(context),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
