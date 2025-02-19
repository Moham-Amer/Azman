import 'package:azman/core/constants/app_strings.dart';
import 'package:azman/features/booking/screens/booking_screen.dart';
import 'package:azman/features/profile/screens/profile_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/generic_widgets/bottom_navigation_bar/bloc/bottom_navigation_cubit.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../../explore/screens/explore_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void initState() {
    super.initState();
    context.read<BottomNavigationCubit>().changePageIndex(newPageIndex: 0);
  }

  int selectedIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    BookingScreen(),
    HomeScreen(),
    ExploreScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (BuildContext context, BottomNavigationState state) {
      return Scaffold(
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 67.h,
          decoration: BoxDecoration(
            color: appColors.whiteColor.withOpacity(0.1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: BottomNavigationBar(

            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: appColors.amberColor,
            unselectedItemColor: appColors.whiteColor,
            selectedLabelStyle: AppTextStyle.f10W400Amber(context),
            unselectedLabelStyle: AppTextStyle.f10W400White(context),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom:8.h),
                  child: SvgPicture.asset(
                    state.pageIndex == 0
                        ? AppImages.homeFilled
                        : AppImages.home,
                    width: 24.w,
                    height: 24.h,
                    color: state.pageIndex == 0
                        ? appColors.amberColor
                        : appColors.whiteColor,
                  ),
                ),
                label: AppStrings.home.tr(),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom:8.h),
                  child: SvgPicture.asset(
                    state.pageIndex == 1
                        ? AppImages.bookingFilled
                        : AppImages.booking,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                label: AppStrings.myBooking.tr(),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom:8.h),
                  child: SvgPicture.asset(
                    AppImages.library,
                    width: 24.w,
                    height: 24.h,
                    color: state.pageIndex == 2
                        ? appColors.amberColor
                        : appColors.whiteColor,
                  ),
                ),
                label: AppStrings.libray.tr(),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom:8.h),
                  child: Icon(Icons.search,
                      color: state.pageIndex == 3
                          ? appColors.amberColor
                          : appColors.whiteColor,
                  ),
                ),
                label: AppStrings.explore.tr(),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom:8.h),
                  child: SvgPicture.asset(
                    state.pageIndex == 4
                        ? AppImages.profileFilled
                        : AppImages.profile,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                label: AppStrings.myProfile.tr(),
              ),
            ],
            onTap: (index) {
              context
                  .read<BottomNavigationCubit>()
                  .changePageIndex(newPageIndex: index);
            },
            currentIndex: state.pageIndex,
          ),
        ),
        body: pages[state.pageIndex.clamp(0, pages.length - 1)],
      );
    });
  }
}
