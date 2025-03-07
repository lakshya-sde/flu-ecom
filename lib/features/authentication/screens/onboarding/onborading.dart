import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/utils/constants/text_strings.dart';
import 'package:flu_ecom/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:flu_ecom/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:flu_ecom/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:flu_ecom/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:flu_ecom/features/authentication/controllers/onborading/onboarding_controller.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Pre-cache all onboarding images
    precacheImage(AssetImage(TImages.onBoardingImage1), context);
    precacheImage(AssetImage(TImages.onBoardingImage2), context);
    precacheImage(AssetImage(TImages.onBoardingImage3), context);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updateCurrentIndex,
            children: [
              OnboardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnboardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnboardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          ///Skip Button
          const OnBoardSkip(),

          ///Dot Navigation SmoothPage Indicator
          OnboardingDotNavigation(),

          ///Circular Button
          OnboardingNextButton(),
        ],
      ),
    );
  }
}
