import 'package:azman/features/authentication/screens/log_in_sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif/gif.dart';

import '../../../core/constants/app_const.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/theme/app_colors.dart';
import '../../home/screens/main_screen.dart';
import '../../onboarding/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState(isLoggedIn: isLoggedIn);
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final bool isLoggedIn;

  _SplashScreenState({required this.isLoggedIn});

  late GifController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);

    Future.delayed(const Duration(seconds: 8), () {
      if ((box.read('isFirstOpen') ?? true) == true) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => OnboardingScreen(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                isLoggedIn ? MainScreen() : LogInSignUpScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;

    return Scaffold(
      backgroundColor: appColors.darkerBlueColor,
      body: Center(
        child: Gif(
          width: 400.w,
          height: 400.h,
          image: AssetImage(AppImages.azmanGif),
          controller: _controller,
          autostart: Autostart.no,
          fps: 20,
          onFetchCompleted: () {
            _controller.reset();
            _controller.forward();
          },
        ),
      ),
    );
  }
}
