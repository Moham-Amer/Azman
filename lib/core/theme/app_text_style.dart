import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyle {
  ///f10
  static TextStyle f10W400Amber(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontVariations: [FontVariation.weight(400)],
      fontSize: 10.sp,
      color: colors.amberColor,
    );
  }

  static TextStyle f10W400White(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontVariations: [FontVariation.weight(400)],
      fontSize: 10.sp,
      color: colors.whiteColor,
    );
  }

  static TextStyle f10W700White(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontVariations: [FontVariation.weight(700)],
      fontSize: 10.sp,
      color: colors.whiteColor,
    );
  }

  ///f12
  static TextStyle f12W400White(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontVariations: [FontVariation.weight(400)],
      fontSize: 12.sp,
      color: colors.whiteColor,
    );
  }

  static TextStyle f12W400DarkGrey(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontVariations: [FontVariation.weight(400)],
      fontSize: 12.sp,
      color: colors.darkGreyColor,
    );
  }

  static TextStyle f12W400Navy(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontVariations: [FontVariation.weight(400)],
      fontSize: 12.sp,
      color: colors.navyColor,
    );
  }

  static TextStyle f12W400Amber(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontVariations: [FontVariation.weight(400)],
      fontSize: 12.sp,
      color: colors.amberColor,
    );
  }

  static TextStyle f12W400Grey(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontVariations: [FontVariation.weight(400)],
      fontSize: 12.sp,
      color: colors.greyColor,
    );
  }

  static TextStyle f12W500DarkGrey(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontVariations: [FontVariation.weight(500)],
      fontSize: 12.sp,
      color: colors.darkGreyColor,
    );
  }

  static TextStyle f12W500Grey(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontVariations: [FontVariation.weight(500)],
      fontSize: 12.sp,
      color: colors.greyColor,
    );
  }

  static TextStyle f12W500LighterBlue(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontVariations: [FontVariation.weight(500)],
      fontSize: 12.sp,
      color: colors.lighterBlueColor,
    );
  }

  static TextStyle f12W600LighterBlue(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontVariations: [FontVariation.weight(600)],
      fontSize: 12.sp,
      color: colors.lighterBlueColor,
    );
  }

  static TextStyle f12W600White(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontVariations: [FontVariation.weight(600)],
      fontSize: 12.sp,
      color: colors.whiteColor,
    );
  }
  static TextStyle f12W700White(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontVariations: [FontVariation.weight(700)],
      fontSize: 12.sp,
      color: colors.whiteColor,
    );
  }

 static TextStyle f12W700Amber(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontVariations: [FontVariation.weight(700)],
      fontSize: 12.sp,
      color: colors.amberColor,
    );
  }

  ///f14

  static TextStyle f14W400White(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontVariations: [FontVariation.weight(400)],
      fontSize: 14.sp,
      color: colors.whiteColor,
    );
  }

  static TextStyle f14W400DarkGrey(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontVariations: [FontVariation.weight(400)],
      fontSize: 14.sp,
      color: colors.darkGreyColor,
    );
  }

  static TextStyle f14W400Black(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontVariations: [FontVariation.weight(400)],
      fontSize: 14.sp,
      color: colors.blackColor,
    );
  }

  static TextStyle f14W500Black(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontVariations: [FontVariation.weight(500)],
      fontSize: 14.sp,
      color: colors.blackColor,
    );
  }
static TextStyle f14W500White(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontVariations: [FontVariation.weight(500)],
      fontSize: 14.sp,
      color: colors.whiteColor,
    );
  }

  static TextStyle f14W600Black(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontVariations: [FontVariation.weight(600)],
      fontSize: 14.sp,
      color: colors.blackColor,
    );
  }

  ///f15

  static TextStyle f15W400Black(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontVariations: [FontVariation.weight(500)],
      fontSize: 15.sp,
      color: colors.blackColor,
    );
  }

  static TextStyle f15W400LighterBlue(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontVariations: [FontVariation.weight(500)],
      fontSize: 15.sp,
      color: colors.lighterBlueColor,
    );
  }

  static TextStyle f15W500MediumGrey(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontVariations: [FontVariation.weight(500)],
      fontSize: 15.sp,
      color: colors.mediumGreyColor,
    );
  }

  ///f16
  static TextStyle f16W500White(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontVariations: [FontVariation.weight(500)],
      fontSize: 16.sp,
      color: colors.whiteColor,
    );
  }

  static TextStyle f16W700White(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontVariations: [FontVariation.weight(700)],
      fontSize: 16.sp,
      color: colors.whiteColor,
    );
  }
static TextStyle f16W800White(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w800,
      fontVariations: [FontVariation.weight(800)],
      fontSize: 16.sp,
      color: colors.whiteColor,
    );
  }

  ///f18
  static TextStyle f18W400White(BuildContext context) {
      final colors = Theme.of(context).extension<CustomColors>()!;
      return TextStyle(
        fontWeight: FontWeight.w400,
        fontVariations: [FontVariation.weight(400)],
        fontSize: 18.sp,
        color: colors.whiteColor,
      );
    }
  static TextStyle f18W700White(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontVariations: [FontVariation.weight(700)],
      fontSize: 18.sp,
      color: colors.whiteColor,
    );
  }

  static TextStyle f18W700Amber(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontVariations: [FontVariation.weight(700)],
      fontSize: 18.sp,
      color: colors.amberColor,
    );
  }

  ///f20
  static TextStyle f20W700DarkWhite(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontVariations: [FontVariation.weight(700)],
      fontSize: 20.sp,
      color: colors.almostWhiteColor,
    );
  }
  static TextStyle f20W700LighterBlue(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontVariations: [FontVariation.weight(700)],
      fontSize: 20.sp,
      color: colors.lighterBlueColor,
    );
  }

  static TextStyle f20W700White(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontVariations: [FontVariation.weight(700)],
      fontSize: 20.sp,
      color: colors.whiteColor,
    );
  }

static TextStyle f20W700Amber(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontVariations: [FontVariation.weight(700)],
      fontSize: 20.sp,
      color: colors.amberColor,
    );
  }
static TextStyle f20W900White(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontVariations: [FontVariation.weight(900)],
      fontSize: 20.sp,
      color: colors.whiteColor,
    );
  }
static TextStyle f20W900Amber(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontVariations: [FontVariation.weight(900)],
      fontSize: 20.sp,
      color: colors.amberColor,
    );
  }

  ///f24
  static TextStyle f24W800White(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w800,
      fontVariations: [FontVariation.weight(800)],
      fontSize: 24.sp,
      color: colors.whiteColor,
    );
  }
static TextStyle f24W700LighterBlue(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontVariations: [FontVariation.weight(700)],
      fontSize: 24.sp,
      color: colors.lighterBlueColor,
    );
  }

  ///f26
  static TextStyle f26W700White(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontVariations: [FontVariation.weight(700)],
      fontSize: 26.sp,
      color: colors.whiteColor,
    );
  }

  ///f32
  static TextStyle f32W700White(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontVariations: [FontVariation.weight(700)],
      fontSize: 32.sp,
      color: colors.whiteColor,
    );
  }
  static TextStyle f36W700White(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontVariations: [FontVariation.weight(700)],
      fontSize: 36.sp,
      color: colors.whiteColor,
    );
  }
}
