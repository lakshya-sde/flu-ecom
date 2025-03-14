import 'package:flu_ecom/common/widgets/texts/section_heading.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(title: 'Payment Method', showActionButton: true, buttonTitle: 'Change', onPressed: () {}),
        Text('Coding with T', style: Theme.of(context).textTheme.bodyLarge),
        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey, size: 16),
            SizedBox(width: TSizes.spaceBtwItems),
            Text('+92-317-8059525', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey, size: 16),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              child: Text('South Liana, Maine 87695, USA', style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
            ),
          ],
        )
      ],
    );
  }
}
