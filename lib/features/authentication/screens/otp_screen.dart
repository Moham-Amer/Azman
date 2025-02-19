import 'package:azman/core/constants/app_strings.dart';
import 'package:azman/core/generic_widgets/auth_screens_header.dart';
import 'package:azman/core/generic_widgets/main_button.dart';
import 'package:azman/core/theme/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/theme/app_colors.dart';
import 'create_new_password_screen.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  TextEditingController pinCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                  firstText: AppStrings.otpVerification,
                  secondText: AppStrings
                      .enterTheVerificationCodeWeJustSentOnYourEmailAddress),
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
                      height: 70.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 32.w,
                        ),
                        SizedBox(
                          height: 77.h,
                          width: 327.w,
                          child: PinCodeTextField(
                            controller: pinCodeController,
                            appContext: context,
                            textStyle: AppTextStyle.f14W400Black(context),
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 17.w,
                              );
                            },
                            mainAxisAlignment: MainAxisAlignment.start,
                            length: 4,
                            pinTheme: PinTheme(
                              activeFillColor: appColors.nearWhiteColor,
                              inactiveFillColor: appColors.nearWhiteColor,
                              borderWidth: 1,
                              shape: PinCodeFieldShape.box,
                              activeBorderWidth: 1,
                              disabledBorderWidth: 1,
                              errorBorderWidth: 1,
                              inactiveBorderWidth: 1,
                              selectedBorderWidth: 1,
                              borderRadius: BorderRadius.circular(12.r),
                              fieldHeight: 61.h,
                              fieldWidth: 65.w,
                              activeColor: appColors.lighterBlueColor,
                              errorBorderColor: Colors.red,
                              selectedColor: Colors.green,
                              inactiveColor: appColors.darkGreyColor,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 188.h,
                    ),
                    MainButton(
                      text: AppStrings.verify.tr(),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => CreateNewPasswordScreen(),
                          ),
                        );
                      },
                      buttonColor: appColors.lighterBlueColor,
                      textColor: appColors.almostWhiteColor,
                    ),
                    SizedBox(
                      height: 200.h,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       AppStrings.didntReceivedCode.tr(),
                    //       style: AppTextStyle.f15W400Black(context),
                    //     ),
                    //     Text(
                    //       AppStrings.resend.tr(),
                    //       style: AppTextStyle.f15W400LighterBlue(context),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
