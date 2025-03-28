import 'package:flu_ecom/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/constants/text_strings.dart';
import 'package:flu_ecom/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class TermsAndConditionCheckbox extends StatelessWidget {
  const TermsAndConditionCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;

    return Row(
      children: [
        Obx(
          () => SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: controller.isTermsConditionCheckbox.value,
              onChanged: controller.toggleTermsConditionCheckbox,
            ),
          ),
        ),
        SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              //I Agree To
              TextSpan(
                text: '${TTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              //Privacy Policy
              TextSpan(
                text: TTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? TColors.white : TColors.primary,
                    ),
              ),

              //And
              TextSpan(
                text: ' ${TTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              //Terms Of Use
              TextSpan(
                text: TTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? TColors.white : TColors.primary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
