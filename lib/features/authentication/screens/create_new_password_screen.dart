import 'package:azman/core/constants/app_strings.dart';
import 'package:azman/core/generic_widgets/auth_screens_header.dart';
import 'package:azman/core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:azman/core/generic_widgets/main_button.dart';
import 'package:azman/core/theme/app_colors.dart';
import 'package:azman/features/authentication/screens/password_changed_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({super.key});

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
                  firstText: AppStrings.createNewPassword,
                  secondText: AppStrings
                      .yourNewPasswordMustBeUniqueFromThosePreviouslyUsed),
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
                      height: 88.h,
                    ),
                    CustomTextFormField(
                      nameController: newPasswordController,
                      text: AppStrings.newPassword,
                      validatorType: "password",
                      hintText: AppStrings.pass,
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    CustomTextFormField(
                      nameController: confirmPasswordController,
                      text: AppStrings.confirmPassword,
                      validatorType: "password",
                      hintText: AppStrings.pass,
                      isConfirmPassword: true,
                    ),
                    SizedBox(
                      height: 108.h,
                    ),
                    MainButton(
                      text: AppStrings.resetPassword.tr(),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => PasswordChangedScreen(),
                          ),
                        );
                      },
                      buttonColor: appColors.lighterBlueColor,
                      textColor: appColors.almostWhiteColor,
                    ),
                    SizedBox(
                      height: 250.h,
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
