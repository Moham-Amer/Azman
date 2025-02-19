import 'package:azman/core/constants/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/generic_widgets/event_card.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../event_data.dart';
import 'event_screen.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 16.w,
              ),
              Text(
                AppStrings.my.tr(),
                style: AppTextStyle.f20W900White(context),
              ),
              Text(
                AppStrings.booking.tr(),
                style: AppTextStyle.f20W900Amber(context)
                    .copyWith(color: appColors.amberColor),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 16.w,
              ),
              Text(
                AppStrings.enjoyYourTours.tr(),
                style: AppTextStyle.f14W500White(context),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EventScreen(
                    image: eventData[0].image,
                    text: eventData[0].text,
                  ),
                ),
              );
            },
            child: EventCard(
              appColors: appColors,
              image: AppImages.pyramids,
              firstText: AppStrings.buildingThePyramids,
              secondText: AppStrings
                  .witnessTheConstructionOfOneOfTheGreatestWorldWonders,
              date: AppStrings.date1,
              isJoin: false,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EventScreen(
                    image: eventData[1].image,
                    text: eventData[1].text,
                  ),
                ),
              );
            },
            child: EventCard(
              appColors: appColors,
              image: AppImages.liberty,
              firstText: AppStrings.discoveryOfTheAmericas,
              secondText: AppStrings
                  .experienceThePivotalMomentOfExplorationAndItsConsequences,
              date: AppStrings.date2,
              isJoin: false,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EventScreen(
                    image: eventData[2].image,
                    text: eventData[2].text,
                  ),
                ),
              );
            },
            child: EventCard(
              appColors: appColors,
              image: AppImages.greek,
              firstText: AppStrings.legacyOfAncientGreece,
              secondText: AppStrings.theBirthOfPhilosophyDemocracyAndMythology,
              date: AppStrings.date3,
              isJoin: false,
            ),
          ),
        ],
      ),
    );
  }
}
