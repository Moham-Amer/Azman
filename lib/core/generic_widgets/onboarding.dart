import 'package:azman/core/constants/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/authentication/screens/log_in_sign_up_screen.dart';
import '../constants/app_const.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class Onboarding extends StatelessWidget {
  Onboarding(
      {super.key,
      required this.image,
      required this.firstString,
      required this.secondString,
      required this.progressImage,
      required this.onPressedFunction,
      required this.buttonImage,
      required this.backButtonFunction});

  final String image;
  final String firstString;
  final String secondString;
  final String progressImage;
  final Function onPressedFunction;
  final String buttonImage;
  final Function backButtonFunction;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                SizedBox(width: 16.w),
                IconButton(
                  onPressed: () {
                    backButtonFunction();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: appColors.whiteColor,
                  ),
                ),
                SizedBox(width: 265.w),
                GestureDetector(
                  onTap: () {
                    box.write('isFirstOpen', false);

                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => LogInSignUpScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Text(
                    AppStrings.skip.tr(),
                    style: AppTextStyle.f16W800White(context),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 500.h,
              ),
            Row(
              children: [
                SizedBox(
                  width: 16.w,
                ),
                SizedBox(
                  width: 343.w,
                  height: 180.h,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 250.w,
                            height: 75.h,
                            child: Text(
                              textAlign: TextAlign.start,
                              firstString.tr(),
                              style: AppTextStyle.f24W800White(context),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          SizedBox(
                            width: 258.w,
                            height: 90.h,
                            child: Text(
                              textAlign: TextAlign.start,
                              secondString.tr(),
                              style: AppTextStyle.f14W400White(context),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      Column(
                        children: [
                          SizedBox(height: 78.h),
                          GestureDetector(
                            onTap: () {
                              onPressedFunction();
                            },
                            child: SvgPicture.asset(
                              buttonImage,
                              width: 50.w,
                              height: 51.h,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            SvgPicture.asset(
              progressImage,
              width: 32.w,
              height: 6.h,
            ),
          ],
        ),
      ),
    );
  }
}
