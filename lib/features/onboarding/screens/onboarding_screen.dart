import 'package:azman/features/authentication/screens/log_in_sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/generic_widgets/onboarding.dart';
import '../onboarding_data.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController pageController = PageController();

  OnboardingScreen({super.key});

  void nextPage(BuildContext context, int currentIndex) {
    if (currentIndex < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      box.write('isFirstOpen', false);

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => LogInSignUpScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    }
  }

  void previousPage(BuildContext context, int currentIndex) {
    if (currentIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      SystemNavigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: onboardingData.length,
        itemBuilder: (context, index) {
          final onboardingItem = onboardingData[index];
          return Onboarding(
            image: onboardingItem.image,
            progressImage: onboardingItem.progress,
            firstString: onboardingItem.firstString,
            secondString: onboardingItem.secondString,
            onPressedFunction: () => nextPage(context, index),
            backButtonFunction: () => previousPage(context, index),
            buttonImage: onboardingItem.buttonImage,
          );
        },
      ),
    );
  }
}
