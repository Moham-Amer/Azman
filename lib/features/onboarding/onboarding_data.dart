import '../../core/constants/app_images.dart';
import '../../core/constants/app_strings.dart';
import 'models/onboarding_model.dart';

List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: AppImages.onBoardingImage1,
    progress: AppImages.progressImage1,
    firstString: AppStrings.onboarding1Text1,
    secondString: AppStrings.onboarding1Text2,
  buttonImage: AppImages.buttonImage1
  ),
  OnboardingModel(
    image: AppImages.onBoardingImage2,
    progress: AppImages.progressImage2,
    firstString: AppStrings.onboarding2Text1,
    secondString: AppStrings.onboarding2Text2,
      buttonImage: AppImages.buttonImage2
  ),
  OnboardingModel(
    image: AppImages.onBoardingImage3,
    progress: AppImages.progressImage3,
    firstString: AppStrings.onboarding3Text1,
    secondString: AppStrings.onboarding3Text2,
      buttonImage: AppImages.buttonImage3

  ),
];
