import 'package:azman/core/constants/app_strings.dart';
import 'package:azman/core/generic_widgets/custom_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/generic_widgets/custom_grid_area.dart';
import '../../../core/generic_widgets/event_card.dart';
import '../../../core/theme/app_colors.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../../core/theme/app_text_style.dart';
class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70.h,
            ),
            Container(
                width: 351.w,
                height: 47.h,
                child: TextFormField(
                  style: AppTextStyle.f16W500White(context),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                    hintText: AppStrings.search.tr(),
                    hintStyle: AppTextStyle.f16W500White(context).copyWith(
                      color: Colors.white.withOpacity(0.41),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppImages.search,
                        width: 18.w,
                        height: 18.h,
                      ),
                    ),
                    fillColor:
                        appColors.whiteColor.withOpacity(0.10000000149011612),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: appColors.darkerBlueColor, width: 1.w),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: appColors.darkerBlueColor, width: 1.w),
                    ),
                  ),
                )),
            Container(
              height: 1200.h,
              color: appColors.darkerBlueColor,
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            AppStrings.categories.tr(),
                            style: AppTextStyle.f16W500White(context),
                          ),
                          SizedBox(
                            width: 215.w,
                          ),
                          Text(
                            AppStrings.showAll.tr(),
                            style: AppTextStyle.f12W500LighterBlue(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15.w,
                      ),
                      Column(
                        children: [
                          CustomContainer(text: AppStrings.characters),
                          SizedBox(
                            height: 8.h,
                          ),
                          CustomContainer(text: AppStrings.artisticPaintings)
                        ],
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        children: [
                          CustomContainer(
                              text: AppStrings.archaeologicalPlaces),
                          SizedBox(
                            height: 8.h,
                          ),
                          CustomContainer(
                              text: AppStrings.famousEvents)
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            AppStrings.mostPopular.tr(),
                            style: AppTextStyle.f16W500White(context),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 191.w,
                      ),
                      Text(
                        AppStrings.showAll.tr(),
                        style: AppTextStyle.f12W500LighterBlue(context),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SizedBox(
                      height: 350.h,
                      child: LayoutGrid(
                        areas: '''
                      first first second second
                      first first fourth fourth
                      third third fourth fourth
                    ''',
                        columnSizes: [1.fr, 1.fr, 1.fr, 1.fr],
                        rowSizes: [auto, auto, auto],
                        columnGap: 10,
                        rowGap: 10,
                        children: [
                          CustomGridArea(
                            title: AppStrings.plato,
                            image: AppImages.plato,
                            isRating: false,
                          ).inGridArea('first'),
                          CustomGridArea(
                            title: AppStrings.constantinusI,
                            image: AppImages.constantinus,
                            isRating: false,
                          ).inGridArea('second'),
                          CustomGridArea(
                            title: AppStrings.salahAldin,
                            image: AppImages.salah,
                            isRating: false,
                          ).inGridArea('third'),
                          CustomGridArea(
                            title: AppStrings.nefertiti,
                            image: AppImages.nefertiti,
                            isRating: false,
                          ).inGridArea('fourth'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            AppStrings.recentEvents.tr(),
                            style: AppTextStyle.f16W500White(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  EventCard(
                    appColors: appColors,
                    image: AppImages.trojan,
                    firstText: AppStrings.trojanHorse,
                    secondText: AppStrings
                        .trojanHorseDescription,
                    date: AppStrings.date1,
                    isJoin: false,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  EventCard(
                    appColors: appColors,
                    image: AppImages.palestine,
                    firstText: AppStrings.palestineWar,
                    secondText: AppStrings
                        .palestineWarDescription,
                    date: AppStrings.date2,
                    isJoin: false,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            AppStrings.topVisited.tr(),
                            style: AppTextStyle.f16W500White(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SizedBox(
                      height: 220.h,
                      child: LayoutGrid(
                        areas: '''
                    first first second second
                    first first second second
               
                  ''',
                        columnSizes: [1.fr, 1.fr, 1.fr, 1.fr],
                        rowSizes: [auto, auto],
                        columnGap: 10,
                        rowGap: 10,
                        children: [
                          CustomGridArea(image: AppImages.andalous, title: AppStrings.alAndalous,isRating:true).inGridArea('first'),
                        CustomGridArea(image: AppImages.parthenon, title: AppStrings.parthenon,isRating:true).inGridArea('second'),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
