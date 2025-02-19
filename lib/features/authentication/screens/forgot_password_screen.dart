import 'package:azman/core/generic_widgets/auth_screens_header.dart';
import 'package:azman/core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:azman/core/generic_widgets/main_button.dart';
import 'package:azman/core/theme/app_text_style.dart';
import 'package:azman/features/authentication/screens/otp_screen.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import 'log_in_sign_up_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return Scaffold(
      backgroundColor: appColors.darkerBlueColor,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AuthScreensHeader(
                  firstText: AppStrings.forgotPassword,
                  secondText: AppStrings
                      .pleaseEnterTheEmailAddressLinkedWithYourAccount),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    CustomTextFormField(
                      nameController: emailAddressController,
                      text: AppStrings.enterYourEmail,
                      keyboardType: TextInputType.emailAddress,
                      validatorType: "email",
                    ),
                    SizedBox(
                      height: 177.h,
                    ),
                    MainButton(
                        text: AppStrings.sendCode.tr(),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => OtpScreen(),
                            ),
                          );
                        },
                        buttonColor: appColors.lighterBlueColor,
                        textColor: appColors.almostWhiteColor),
                    SizedBox(
                      height: 190.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.rememberPassword.tr(),
                          style: AppTextStyle.f15W400Black(context),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => LogInSignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            AppStrings.logIn.tr(),
                            style: AppTextStyle.f15W400LighterBlue(context),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> cacheLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }
}
