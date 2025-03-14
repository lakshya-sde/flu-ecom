import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/utils/helpers/helper_functions.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/rounded_container.dart';

class CouponWidget extends StatelessWidget {
  const CouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: EdgeInsets.only(top: TSizes.sm, bottom: TSizes.sm, right: TSizes.sm, left: TSizes.md),
      child: Row(
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          ///Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: dark ? TColors.white.withValues(alpha: 0.5) : TColors.dark.withValues(alpha: 0.5),
                backgroundColor: Colors.grey.withValues(alpha: 0.2),
                side: BorderSide(color: Colors.grey.withValues(alpha: 0.1)),
              ),
              child: Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
