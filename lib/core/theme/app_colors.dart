import 'package:flutter/material.dart';

class AppColors {
  static const Color lighterBlueColor = Color.fromARGB(255, 69, 130, 196);
  static const Color navyColor = Color.fromARGB(255, 193, 199, 207);
  static const Color darkGreyColor = Color.fromARGB(255, 108, 114, 120);
  static const Color greyColor = Color.fromARGB(255, 109, 109, 109);
  static const Color almostWhiteColor = Color.fromARGB(255, 249, 249, 249);
  static const Color mediumGreyColor = Color.fromARGB(255, 152, 162, 175);
  static const Color nearWhiteColor = Color.fromARGB(255, 247, 248, 249);
  static const Color snowColor = Color.fromARGB(255, 217, 217, 217);
  static const Color darkerWhiteColor = Color.fromARGB(255, 237, 241, 243);
  static const Color darkerBlueColor = Color.fromARGB(255, 16, 23, 58);
  static const Color whiteColor = Color.fromARGB(255, 255, 255, 255);
  static const Color blackColor = Color.fromARGB(255, 0, 0, 0);
  static const Color grayishBlueColor = Color.fromARGB(255, 125, 125, 145);
  static const Color amberColor = Color.fromARGB(255, 246, 186, 58);
}

class CustomColors extends ThemeExtension<CustomColors> {
  final Color lighterBlueColor;
  final Color darkGreyColor;
  final Color almostWhiteColor;
  final Color mediumGreyColor;
  final Color snowColor;
  final Color darkerWhiteColor;
  final Color darkerBlueColor;
  final Color whiteColor;
  final Color blackColor;
  final Color grayishBlueColor;
  final Color nearWhiteColor;
  final Color amberColor;
  final Color greyColor;
  final Color navyColor;

  const CustomColors({
    required this.lighterBlueColor,
    required this.darkGreyColor,
    required this.almostWhiteColor,
    required this.mediumGreyColor,
    required this.snowColor,
    required this.darkerWhiteColor,
    required this.darkerBlueColor,
    required this.whiteColor,
    required this.blackColor,
    required this.grayishBlueColor,
    required this.nearWhiteColor,
    required this.amberColor,
    required this.greyColor,
    required this.navyColor,
  });

  @override
  CustomColors copyWith({
    Color? lighterBlueColor,
    Color? nearBlackColor,
    Color? darkGreyColor,
    Color? lightGreyColor,
    Color? mediumGreyColor,
    Color? snowColor,
    Color? darkerWhiteColor,
    Color? darkerBlueColor,
    Color? whiteColor,
    Color? blackColor,
    Color? grayishBlueColor,
    Color? nearWhiteColor,
    Color? amberColor,
    Color? greyColor,
    Color? navyColor,
    Color? almostWhiteColor,
  }) {
    return CustomColors(
        whiteColor: whiteColor ?? this.whiteColor,
        lighterBlueColor: lighterBlueColor ?? this.lighterBlueColor,
        darkGreyColor: darkGreyColor ?? this.darkGreyColor,
        almostWhiteColor: almostWhiteColor ?? this.almostWhiteColor,
        mediumGreyColor: mediumGreyColor ?? this.mediumGreyColor,
        snowColor: snowColor ?? this.snowColor,
        darkerWhiteColor: darkerWhiteColor ?? this.darkerWhiteColor,
        darkerBlueColor: darkerBlueColor ?? this.darkerBlueColor,
        blackColor: blackColor ?? this.blackColor,
        grayishBlueColor: grayishBlueColor ?? this.grayishBlueColor,
        nearWhiteColor: nearWhiteColor ?? this.nearWhiteColor,
        navyColor: navyColor ?? this.navyColor,
        amberColor: amberColor ?? this.amberColor,
        greyColor: greyColor ?? this.greyColor);
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    return this;
  }

  static const lightCustomColors = CustomColors(
      lighterBlueColor: AppColors.lighterBlueColor,
      darkGreyColor: AppColors.darkGreyColor,
      almostWhiteColor: AppColors.almostWhiteColor,
      mediumGreyColor: AppColors.mediumGreyColor,
      snowColor: AppColors.snowColor,
      darkerWhiteColor: AppColors.darkerWhiteColor,
      darkerBlueColor: AppColors.darkerBlueColor,
      whiteColor: AppColors.whiteColor,
      blackColor: AppColors.blackColor,
      grayishBlueColor: AppColors.grayishBlueColor,
      amberColor: AppColors.amberColor,
      nearWhiteColor: AppColors.nearWhiteColor,
      navyColor: AppColors.navyColor,
      greyColor: AppColors.greyColor);
  static const darkCustomColors = CustomColors(
    lighterBlueColor: Color.fromARGB(255, 100, 160, 220),
    darkGreyColor: Color.fromARGB(255, 180, 185, 190),
    almostWhiteColor: Color.fromARGB(255, 240, 240, 240),
    mediumGreyColor: Color.fromARGB(255, 200, 205, 210),
    snowColor: Color.fromARGB(255, 225, 225, 225),
    darkerWhiteColor: Color.fromARGB(255, 245, 245, 245),
    darkerBlueColor: Color.fromARGB(255, 180, 190, 220),
    whiteColor: Color.fromARGB(255, 255, 255, 255),
    blackColor: Color.fromARGB(255, 0, 0, 0),
    grayishBlueColor: Color.fromARGB(255, 160, 170, 190),
    amberColor: Color.fromARGB(255, 255, 210, 100),
    nearWhiteColor: Color.fromARGB(255, 250, 250, 250),
    navyColor: Color.fromARGB(255, 170, 180, 200),
    greyColor: Color.fromARGB(255, 190, 190, 190),
  );
}
