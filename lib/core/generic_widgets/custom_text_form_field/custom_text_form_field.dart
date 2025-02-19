import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/app_images.dart';
import '../../constants/app_strings.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';
import 'bloc/text_form_field_cubit.dart';
import 'bloc/text_form_field_state.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.nameController,
      required this.text,
      this.isPassword = false,
      this.isConfirmPassword = false,
      this.keyboardType,
      this.validatorType,
      this.hintText,
      this.originalPasswordController});

  TextEditingController nameController;
  String text;
  bool isPassword;
  bool isConfirmPassword;
  TextInputType? keyboardType;
  String? validatorType;
  String? hintText;
  final TextEditingController? originalPasswordController;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;

    return BlocBuilder<TextFormFieldCubit, TextFormFieldState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 24.w,
                ),
                Text(
                  text.tr(),
                  style: AppTextStyle.f14W500Black(context),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              width: 327.w,
              height: 56.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    offset: Offset(0, 1.5),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: TextFormField(
                validator: (value) {
                  if (validatorType == "email") {
                    if (value == null ||
                        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return AppStrings.emailValidator.tr();
                    }
                    return null;
                  } else if (validatorType == "password") {
                    if (value == null || value.length < 8) {
                      return AppStrings.passwordValidator.tr();
                    }
                    return null;
                  } else if (validatorType == "confirmPassword") {
                    if (value != originalPasswordController?.text) {
                      return AppStrings.confirmPasswordValidator.tr();
                    }
                    return null;
                  }
                  return null;
                },
                style: AppTextStyle.f14W400Black(context),
                keyboardType: keyboardType ?? TextInputType.text,
                controller: nameController,
                decoration: InputDecoration(
                  hintText: hintText?.tr(),
                  hintStyle: AppTextStyle.f14W400DarkGrey(context),
                  fillColor: appColors.whiteColor,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: appColors.darkerWhiteColor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: appColors.darkerWhiteColor, width: 1),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Visibility(
                      visible: isPassword || isConfirmPassword,
                      child: IconButton(
                        onPressed: () {
                          if (isPassword) {
                            context
                                .read<TextFormFieldCubit>()
                                .changeHiddenStatue();
                          } else if (isConfirmPassword) {
                            context
                                .read<TextFormFieldCubit>()
                                .changeConfirmHiddenStatue();
                          }
                        },
                        icon: isPassword
                            ? (context
                                    .read<TextFormFieldCubit>()
                                    .hiddenPassword)
                                ? SvgPicture.asset(
                                    AppImages.visibilityOff,
                                    height: 15.h,
                                    width: 19.w,
                                    color: appColors.darkGreyColor,
                                  )
                                : SvgPicture.asset(
                                    AppImages.visibility,
                                    height: 24.h,
                                    width: 29.w,
                                    color: appColors.darkGreyColor,
                                  )
                            : (isConfirmPassword)
                                ? (context
                                        .read<TextFormFieldCubit>()
                                        .hiddenConfirmPassword)
                                    ? SvgPicture.asset(
                                        AppImages.visibilityOff,
                                        height: 15.h,
                                        width: 19.w,
                                        color: appColors.darkGreyColor,
                                      )
                                    : SvgPicture.asset(
                                        AppImages.visibility,
                                        height: 24.h,
                                        width: 29.w,
                                        color: appColors.darkGreyColor,
                                      )
                                : const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ),
                obscureText: isPassword
                    ? context.read<TextFormFieldCubit>().hiddenPassword
                    : isConfirmPassword
                        ? context
                            .read<TextFormFieldCubit>()
                            .hiddenConfirmPassword
                        : false,
              ),
            ),
          ],
        );
      },
    );
  }
}
