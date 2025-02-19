import 'package:azman/core/constants/app_strings.dart';
import 'package:azman/core/generic_widgets/custom_container.dart';
import 'package:azman/features/booking/event_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/generic_widgets/custom_grid_area.dart';
import '../../../core/generic_widgets/event_card.dart';
import '../../../core/theme/app_colors.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../../core/theme/app_text_style.dart';
import '../../booking/screens/event_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  int sliderIndex = 0;

  List<String> eras = [
    AppStrings.thePast,
    AppStrings.thePresent,
    AppStrings.theFuture
  ];
  List<String> erasText = [
    AppStrings.learnAboutThePastInAllItsAspects,
    AppStrings.discoverThingsYouDidntKnowAboutThePresent,
    AppStrings.lookToTheFutureAndGetReadyToDiscoverIt
  ];
  List<String> erasImages = [
    AppImages.past,
    AppImages.present,
    AppImages.future
  ];
  List<String> progress = [
    AppImages.progressImage1,
    AppImages.progressImage2,
    AppImages.progressImage3,
  ];

  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Container(
              color: appColors.darkerBlueColor,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                      ),
                      Text(
                        AppStrings.journeyThrough.tr(),
                        style: AppTextStyle.f18W700White(context),
                      ),
                      Text(
                        AppStrings.time.tr(),
                        style: AppTextStyle.f18W700Amber(context),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                      ),
                      Text(
                        AppStrings.exploreLearnAndExperienceAgesLikeNeverBefore
                            .tr(),
                        style: AppTextStyle.f12W400White(context),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 225.h,
              child: CarouselSlider.builder(
                  itemCount: erasImages.length,
                  options: CarouselOptions(
                    height: 258.h,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayCurve: Curves.easeInOut,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      selectedIndex.value = index;
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    sliderIndex = index;
                    return Builder(
                      builder: (context) {
                        return Column(
                          children: [
                            Container(
                              height: 200.h,
                              width: 343.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(erasImages[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 127.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 12.w,
                                              ),
                                              Text(
                                                eras[index].tr(),
                                                style:
                                                    AppTextStyle.f20W700DarkWhite(
                                                        context),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 12.w,
                                              ),
                                              Container(
                                                width: 190.w,
                                                child: Text(
                                                  erasText[index].tr(),
                                                  style: AppTextStyle.f12W400White(
                                                      context),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 7.w),
                                      Container(
                                        width: 113.w,
                                        height: 32.h,
                                        padding: const EdgeInsets.all(8),
                                        decoration: ShapeDecoration(
                                          color: appColors.amberColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            AppStrings.startYourJourney.tr(),
                                            style:
                                                AppTextStyle.f10W700White(context),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                    );
                  }),
            ),
            SizedBox(
              height: 16.h,
            ),
            ValueListenableBuilder<int>(
                valueListenable: selectedIndex,
                builder: (context, index, child) {
                  return SvgPicture.asset(
                    progress[index],
                    width: 32.w,
                    height: 6.h,
                  );
                }),
            Container(
              height: 1000.h,
              color: appColors.darkerBlueColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 16.w,
                            ),
                            Text(
                              AppStrings.chooseYourExperience.tr(),
                              style: AppTextStyle.f16W500White(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 16.w,
                        ),
                        Column(
                          children: [
                            CustomContainer(
                                text: AppStrings.interactWithHistoricalFigures),
                            SizedBox(
                              height: 8.h,
                            ),
                            CustomContainer(
                                text: AppStrings.playEducationalGames)
                          ],
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Column(
                          children: [
                            CustomContainer(text: AppStrings.exploreTheFuture),
                            SizedBox(
                              height: 8.h,
                            ),
                            CustomContainer(
                                text: AppStrings.visitTheKnowledgeLibrary)
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
                              width: 16.w,
                            ),
                            Text(
                              AppStrings.featuredHistoricalEras.tr(),
                              style: AppTextStyle.f16W500White(context),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 110.w,
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
                    Row(
                      children: [
                        SizedBox(
                          width: 16.w,
                        ),
                        Opacity(
                          opacity: 0.8,
                          child: Text(
                            AppStrings
                                .diveIntoTheRichTapestryOfHistory
                                .tr(),
                            style: AppTextStyle.f12W400White(context),
                          ),
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
                              title: AppStrings.ancientEgypt,
                              image: AppImages.egypt,
                              isRating: false,
                            ).inGridArea('first'),
                            CustomGridArea(
                              title: AppStrings.islamGoldenAge,
                              image: AppImages.islam,
                              isRating: false,
                            ).inGridArea('second'),
                            CustomGridArea(
                              title: AppStrings.ancientGreece,
                              image: AppImages.greece,
                              isRating: false,
                            ).inGridArea('third'),
                            CustomGridArea(
                              title: AppStrings.ancientRome,
                              image: AppImages.rome,
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
                              AppStrings.upcomingLiveEvents.tr(),
                              style: AppTextStyle.f16W500White(context),
                            ),
                            SizedBox(
                              width: 120.w,
                            ),
                            Text(
                              AppStrings.showAll.tr(),
                              style: AppTextStyle.f12W500LighterBlue(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 16.w,
                        ),
                        Opacity(
                          opacity: 0.8,
                          child: Text(
                            AppStrings
                                .joinUsForLiveReenactmentsAndInteractiveEvents
                                .tr(),
                            style: AppTextStyle.f12W400White(context),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
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
                        isJoin: true,
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
                        isJoin: true,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
