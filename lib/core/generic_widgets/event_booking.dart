import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/authentication/screens/log_in_sign_up_screen.dart';
import '../constants/app_images.dart';
import '../constants/app_strings.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';
import 'main_button.dart';

class EventBooking extends StatelessWidget {
  EventBooking(
      {super.key,
      required this.appColors,
      required this.image,
      required this.text,});

  final CustomColors appColors;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      SizedBox(width: 16.w),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: appColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 200.h,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: appColors.darkerBlueColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r),
                ),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 200.h,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 21.h),
                      Container(
                        width: 102.w,
                        height: 3.h,
                        decoration: BoxDecoration(
                          color: appColors.snowColor,
                          borderRadius: BorderRadius.all(Radius.circular(32.r)),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Spacer(),
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
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: 360.w,
                        height: 180.h,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 20.r,
                                  backgroundColor: AppColors.amberColor,
                                  child: SvgPicture.asset(
                                    AppImages.booking,
                                    width: 20.w,
                                    height: 20.h,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Container(
                                    width: 1.w,
                                    height: 20.h,
                                    color: appColors.darkGreyColor),
                                SizedBox(height: 4.h),
                                CircleAvatar(
                                  radius: 20.r,
                                  backgroundColor: AppColors.lighterBlueColor,
                                  child: SvgPicture.asset(
                                    AppImages.ticket,
                                    width: 20.w,
                                    height: 20.h,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Container(
                                    width: 1.w,
                                    height: 20.h,
                                    color: appColors.darkGreyColor),
                                SizedBox(height: 4.h),
                                CircleAvatar(
                                  radius: 20.r,
                                  backgroundColor: Colors.white,
                                  child: SvgPicture.asset(
                                    AppImages.profileUser,
                                    width: 20.w,
                                    height: 20.h,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 16.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.dateBooking.tr(),
                                  style: AppTextStyle.f14W400White(context),
                                ),
                                Text(AppStrings.timeBooking.tr(),
                                    style: AppTextStyle.f12W400Grey(context)),
                                SizedBox(height: 35.h),
                                Text(
                                  AppStrings.priceBooking.tr(),
                                  style: AppTextStyle.f14W400White(context),
                                ),
                                SizedBox(height: 40.h),
                                Text(AppStrings.participantsBooking.tr(),
                                    style: AppTextStyle.f14W400White(context)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 26.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.aboutTheEvent.tr(),
                          style: AppTextStyle.f14W400White(context),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: 344.w,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: text.tr(),
                                style: AppTextStyle.f12W400Navy(context),
                              ),
                              TextSpan(
                                text: AppStrings.readMore.tr(),
                                style: AppTextStyle.f12W400Amber(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 60.h),
                      MainButton(
                        text: AppStrings.bookNow,
                        onPressed: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          final bool isLoggedIn =
                              prefs.getBool('isLoggedIn') ?? false;
                          AwesomeDialog(
                            btnOk: ElevatedButton(
                              onPressed: () {
                                (!isLoggedIn)
                                    ? Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LogInSignUpScreen(),
                                        ),
                                        (Route<dynamic> route) => false,
                                      )
                                    : ();
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: appColors.whiteColor,
                                backgroundColor: appColors.amberColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                (isLoggedIn)
                                    ? AppStrings.okay.tr()
                                    : AppStrings.logIn.tr(),
                                style: AppTextStyle.f20W700White(context),
                              ),
                            ),
                            btnCancel: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: appColors.amberColor,
                                backgroundColor: appColors.whiteColor,
                                side: BorderSide(
                                    color: appColors.amberColor, width: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(AppStrings.exit.tr(),
                                  style: AppTextStyle.f20W700Amber(context)),
                            ),
                            dialogBackgroundColor: appColors.whiteColor,
                            customHeader: (isLoggedIn)
                                ? Center(
                                    child:
                                        SvgPicture.asset(AppImages.successBlue),
                                  )
                                : Image(image: AssetImage(AppImages.error)),
                            titleTextStyle: (isLoggedIn)
                                ? AppTextStyle.f20W700LighterBlue(context)
                                : AppTextStyle.f20W700LighterBlue(context)
                                    .copyWith(color: Colors.red),
                            context: context,
                            dialogType: (isLoggedIn)
                                ? DialogType.success
                                : DialogType.error,
                            animType: AnimType.rightSlide,
                            title: (isLoggedIn)
                                ? AppStrings.bookingSuccessful.tr()
                                : AppStrings.pleaseLogInToBook.tr(),
                            dismissOnBackKeyPress: true,
                            dismissOnTouchOutside: true,
                          ).show();
                        },
                        buttonColor: AppColors.amberColor,
                        textColor: Colors.white,
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
