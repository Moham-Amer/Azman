import 'package:azman/core/constants/app_images.dart';
import 'package:azman/core/constants/app_strings.dart';
import 'package:azman/core/generic_widgets/main_button.dart';
import 'package:azman/core/theme/app_colors.dart';
import 'package:azman/core/theme/app_text_style.dart';
import 'package:azman/features/authentication/screens/log_in_sign_up_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 214.h,
          ),
          Center(
            child: SvgPicture.asset(AppImages.success),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            AppStrings.passwordChanged.tr(),
            style: AppTextStyle.f26W700White(context)
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
              width: 256.w,
              child: Text(
                textAlign: TextAlign.center,
                AppStrings.yourPasswordHasBeenChangedSuccessfully.tr(),
                style: AppTextStyle.f15W500MediumGrey(context),
              )),
          SizedBox(
            height: 112.h,
          ),
          MainButton(
              text: AppStrings.logIn.tr(),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LogInSignUpScreen(),
                  ),
                );
              },
              buttonColor: appColors.lighterBlueColor,
              textColor: appColors.almostWhiteColor),
          SizedBox(
            height: 100.h,
          ),
        ],
      ),
    );
  }
}
