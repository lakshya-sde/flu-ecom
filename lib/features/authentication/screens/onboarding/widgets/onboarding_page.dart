import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String title, subtitle, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Image.asset(
            width: THelperFunctions.screenWidth() * 0.8, //80% height
            height: THelperFunctions.screenHeight() * 0.6, //60% height
            image,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
