import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$299.9', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        /// Shipping Fees
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$99.9', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        /// Tax Fees
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$49.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$499.0', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
