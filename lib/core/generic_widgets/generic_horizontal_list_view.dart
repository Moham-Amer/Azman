import 'package:azman/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_images.dart';
import '../theme/app_text_style.dart';

class GenericHorizontalListView extends StatelessWidget {
  const GenericHorizontalListView({
    super.key,
    required this.appColors,
  });

  final CustomColors appColors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165.h,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext, int) {
            return Container(
              decoration: BoxDecoration(
                color: appColors.whiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 153.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            AppImages.onBoardingImage1),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.r),
                      ),
                    ),
                    child: Text(''),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 9.w),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cairo",
                          style:
                          AppTextStyle.f14W500Black(context),
                        ),
                        SizedBox(
                          width: 140.w,
                          child: Text(
                            "categoriscategoricategoriscategoriss",
                            style:
                            AppTextStyle.f12W500Grey(context),
                          ),),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext, int) {
            return SizedBox(
              width: 6.w,
            );
          },
          itemCount: 4),
    );
  }
}
