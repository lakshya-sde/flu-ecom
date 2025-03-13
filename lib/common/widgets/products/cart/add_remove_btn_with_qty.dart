import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/utils/helpers/helper_functions.dart';
import 'package:flu_ecom/common/widgets/icons/circular_icon.dart';

class AddRemoveButtonWithQty extends StatelessWidget {
  const AddRemoveButtonWithQty({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        //Minus
        CircularIcon(
          width: 32,
          height: 32,
          icon: Iconsax.minus,
          size: TSizes.md,
          color: dark ? TColors.white : TColors.black,
          backgroundColor: dark ? TColors.darkerGrey : TColors.light,
        ),

        //Quantity
        SizedBox(width: TSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: TSizes.spaceBtwItems),

        //Add
        CircularIcon(
          width: 32,
          height: 32,
          icon: Iconsax.add,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.primary,
        ),
      ],
    );
  }
}
