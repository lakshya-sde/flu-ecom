import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/helpers/helper_functions.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/rounded_container.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    Color iconColor() {
      if (dark) {
        return TColors.light;
      } else {
        return TColors.dark;
      }
    }

    Color borderColor() {
      if (selectedAddress) {
        return Colors.transparent;
      } else if (dark) {
        return TColors.darkGrey;
      } else {
        return TColors.grey;
      }
    }

    return TRoundedContainer(
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? TColors.primary.withValues(alpha: 0.5) : Colors.transparent,
      borderColor: borderColor(),
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: EdgeInsets.all(TSizes.md),
      child: Stack(
        children: [
          if (selectedAddress)
            Positioned(
              right: 5,
              top: 0,
              child: Icon(Iconsax.tick_circle5, color: iconColor()),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: TSizes.sm / 2),
              Text('(+123) 456 7890', maxLines: 1, overflow: TextOverflow.ellipsis),
              SizedBox(height: TSizes.sm / 2),
              Text('82356, Timmy Coves, South Liana, Maine, 87665, USA', softWrap: true),
            ],
          )
        ],
      ),
    );
  }
}
