import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:azman/core/constants/app_images.dart';
import 'package:azman/core/generic_widgets/custom_container_profile.dart';
import 'package:azman/core/theme/app_colors.dart';
import 'package:azman/core/theme/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/app_strings.dart';
import '../../authentication/bloc/auth_cubit.dart';
import '../../authentication/bloc/auth_state.dart';
import '../../authentication/screens/log_in_sign_up_screen.dart';
import '../../splash/screens/splash_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return Scaffold(
      backgroundColor: appColors.darkerBlueColor,
      body: SingleChildScrollView(
        child: Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 45.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 150.w,
                  ),
                  Text(AppStrings.myProfile.tr(),
                      style: AppTextStyle.f16W700White(context)),
                ],
              ),
              SizedBox(
                height: 9.68.h,
              ),
              SizedBox(
                width: 130.w,
                height: 130.h,
                child: Stack(
                  children: [
                    CircleAvatar(
                        radius: 90.r,
                        backgroundColor: AppColors.darkerBlueColor,
                        child:
                            Image(image: AssetImage(AppImages.profileCircle))),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: SvgPicture.asset(
                        AppImages.messageEdit,
                        width: 30.w,
                        height: 30.h,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                  width: 160.w,
                  height: 55.h,
                  child: Column(children: [
                    Text(
                      AppStrings.profileName.tr(),
                      style: AppTextStyle.f16W700White(context),
                    ),
                    Text(
                      AppStrings.profileNumber.tr(),
                      style: AppTextStyle.f14W400White(context),
                    )
                  ])),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 19.w, right: 14.w),
            child: SizedBox(
              width: 342.w,
              height: 420.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomContainerProfile(
                    imagePath: AppImages.profileUser,
                    text: AppStrings.editProfile.tr(),
                  ),
                  CustomContainerProfile(
                    imagePath: AppImages.heart,
                    text: AppStrings.favourite.tr(),
                  ),
                  CustomContainerProfile(
                    imagePath: AppImages.notification,
                    text: AppStrings.notifications.tr(),
                  ),
                  CustomContainerProfile(
                    imagePath: AppImages.setting,
                    text: AppStrings.settings.tr(),
                  ),
                  CustomContainerProfile(
                    imagePath: AppImages.messageQuestion,
                    text: AppStrings.helpAndSupport.tr(),
                  ),
                  GestureDetector(
                    onTap: () {
                      AwesomeDialog(
                        btnOk: ElevatedButton(
                          onPressed: () {
                            // themeNotifier.value = ThemeMode.light;
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: appColors.whiteColor,
                            backgroundColor: appColors.amberColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            AppStrings.darkMode.tr(),
                            style: AppTextStyle.f12W700White(context),
                          ),
                        ),
                        btnCancel: ElevatedButton(
                          onPressed: () {
                            // themeNotifier.value = ThemeMode.dark;
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: appColors.amberColor,
                            backgroundColor: appColors.whiteColor,
                            side: BorderSide(
                                color: appColors.amberColor, width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(AppStrings.lightMode.tr(),
                              style: AppTextStyle.f12W700Amber(context)),
                        ),
                        dialogBackgroundColor: appColors.whiteColor,
                        desc: AppStrings.whatDoYouWantToChoose.tr(),
                        descTextStyle:
                            AppTextStyle.f12W400Amber(context).copyWith(
                          shadows: [
                            Shadow(
                              color: appColors.blackColor.withOpacity(0.1),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        customHeader: SvgPicture.asset(AppImages.theme,
                            width: 80.w,
                            height: 80.h,
                            color: appColors.lighterBlueColor),
                        context: context,
                        animType: AnimType.rightSlide,
                        titleTextStyle:
                            AppTextStyle.f24W700LighterBlue(context),
                        title: AppStrings.theme.tr(),
                        dismissOnBackKeyPress: true,
                        dismissOnTouchOutside: true,
                      ).show();
                    },
                    child: CustomContainerProfile(
                      imagePath: AppImages.theme,
                      text: AppStrings.theme.tr(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AwesomeDialog(
                        btnOk: ElevatedButton(
                          onPressed: () {
                            context.setLocale(
                              Locale('en'),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: appColors.whiteColor,
                            backgroundColor: appColors.amberColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            AppStrings.english.tr(),
                            style: AppTextStyle.f12W700White(context),
                          ),
                        ),
                        btnCancel: ElevatedButton(
                          onPressed: () {
                            context.setLocale(Locale('ar'));
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: appColors.amberColor,
                            backgroundColor: appColors.whiteColor,
                            side: BorderSide(
                                color: appColors.amberColor, width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(AppStrings.arabic.tr(),
                              style: AppTextStyle.f12W700Amber(context)),
                        ),
                        dialogBackgroundColor: appColors.whiteColor,
                        desc: AppStrings.whatDoYouWantToChoose.tr(),
                        descTextStyle:
                            AppTextStyle.f12W400Amber(context).copyWith(
                          shadows: [
                            Shadow(
                              color: appColors.blackColor.withOpacity(0.1),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        customHeader: SvgPicture.asset(AppImages.language,
                            width: 80.w,
                            height: 80.h,
                            color: appColors.lighterBlueColor),
                        context: context,
                        animType: AnimType.rightSlide,
                        titleTextStyle:
                            AppTextStyle.f24W700LighterBlue(context),
                        title: AppStrings.changeLanguage.tr(),
                        dismissOnBackKeyPress: true,
                        dismissOnTouchOutside: true,
                      ).show();
                    },
                    child: CustomContainerProfile(
                      imagePath: AppImages.language,
                      text: AppStrings.changeLanguage.tr(),
                    ),
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    builder: (BuildContext context, AuthState state) {
                      if (state is LogoutLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return GestureDetector(
                          onTap: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            final bool isLoggedIn =
                                prefs.getBool('isLoggedIn') ?? false;
                            if (isLoggedIn) {
                              String? token = prefs.getString("accessToken");
                              context.read<AuthCubit>().logout(token!);
                            } else {
                              AwesomeDialog(
                                btnOk: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LogInSignUpScreen(),
                                      ),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: appColors.whiteColor,
                                    backgroundColor: appColors.amberColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    AppStrings.okay.tr(),
                                    style: AppTextStyle.f12W700White(context),
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
                                      style:
                                          AppTextStyle.f12W700Amber(context)),
                                ),
                                dialogBackgroundColor: appColors.whiteColor,
                                customHeader:
                                    Image(image: AssetImage(AppImages.error)),
                                context: context,
                                animType: AnimType.rightSlide,
                                titleTextStyle:
                                    AppTextStyle.f20W700LighterBlue(context)
                                        .copyWith(color: Colors.red),
                                title: AppStrings.logIn.tr() +
                                    " " +
                                    AppStrings.or.tr() +
                                    " " +
                                    AppStrings.signUp.tr(),
                                dismissOnBackKeyPress: true,
                                dismissOnTouchOutside: true,
                              ).show();
                            }
                          },
                          child: CustomContainerProfile(
                            imagePath: AppImages.logout,
                            text: AppStrings.logOut.tr(),
                          ),
                        );
                      }
                    },
                    listener: (BuildContext context, AuthState state) async {
                      if (state is LogoutSuccessState) {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.remove('isLoggedIn');
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) =>
                                SplashScreen(isLoggedIn: false),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      }

                      if (state is LogoutErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMsg),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
