import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/utils/helpers/helper_functions.dart';
import 'package:flu_ecom/common/widgets/texts/section_heading.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/rounded_container.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        SectionHeading(
          title: 'Payment Method',
          showActionButton: true,
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: EdgeInsets.all(TSizes.sm),
              child: Image(image: AssetImage(TImages.paypal), fit: BoxFit.contain),
            ),
            SizedBox(width: TSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
      ],
    );
  }
}
