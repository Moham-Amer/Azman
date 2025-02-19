import 'package:azman/core/generic_widgets/secondary_button.dart';
import 'package:azman/core/theme/app_text_style.dart';
import 'package:azman/features/home/screens/main_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_images.dart';
import '../constants/app_strings.dart';
import '../theme/app_colors.dart';

class OtherLoginMethods extends StatelessWidget {
  const OtherLoginMethods({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 24.w,
            ),
            SizedBox(
              width:139.w,
              child: Divider(
                  color: appColors.darkerWhiteColor,
                  thickness: 1),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.w),
              child: Text(
                AppStrings.or.tr(),
                style: AppTextStyle.f12W400DarkGrey(context),
              ),
            ),
            SizedBox(
              width:139.w,
              child: Divider(
                  color: appColors.darkerWhiteColor,
                  thickness: 1),
            ),
            SizedBox(
              width: 24.w,
            ),
          ],
        ),
        SizedBox(
          height: 23.h,
        ),
        SecondaryButton(
            text:
            AppStrings.continueWithGoogle,
            onPressed: () {},
            buttonColor: Colors.white,
            textColor: Colors.black,
            image: AppImages.google),
        SizedBox(
          height: 15.h,
        ),
        SecondaryButton(
            text:
            AppStrings.continueAsAGuest,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ),
                    (Route<dynamic> route) => false,
              );
            },
            buttonColor: Colors.white,
            textColor: Colors.black,
            image: AppImages.guest),
      ],
    );
  }
}