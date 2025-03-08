import 'package:flu_ecom/features/authentication/controllers/onborading/onboarding_controller.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/constants/text_strings.dart';
import 'package:flu_ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardSkip extends StatelessWidget {
  const OnBoardSkip({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => controller.skipPage(),
        child: Text(TTexts.skip),
      ),
    );
  }
}
