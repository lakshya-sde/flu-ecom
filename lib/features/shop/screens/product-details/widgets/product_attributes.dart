import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/common/chips/choice_chip.dart';
import 'package:flu_ecom/utils/constants/text_strings.dart';
import 'package:flu_ecom/utils/helpers/helper_functions.dart';
import 'package:flu_ecom/common/widgets/texts/product_title.dart';
import 'package:flu_ecom/common/widgets/texts/section_heading.dart';
import 'package:flu_ecom/common/widgets/texts/product_price_text.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/rounded_container.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        /// -  Selected Attribute Pricing & Description
        TRoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  SectionHeading(title: 'Variation'),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ProductTitleText(text: 'Price : ', smallSize: true),

                          /// Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: TSizes.spaceBtwItems),

                          /// Sale Price
                          ProductPriceText(price: '20')
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          ProductTitleText(text: 'Stock : ', smallSize: true),
                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation Description
              ProductTitleText(text: TTexts.productDescription, smallSize: true, maxLines: 4),
            ],
          ),
        ),
        SizedBox(height: TSizes.spaceBtwItems),

        /// - Attributes

        // Colors
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title: 'Colors'),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Green', selected: true, onSelected: (value) => {}),
                TChoiceChip(text: 'Blue', selected: false, onSelected: (value) => {}),
                TChoiceChip(text: 'Yellow', selected: false, onSelected: (value) => {}),
              ],
            ),
          ],
        ),

        // Sizes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title: 'Size'),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'UK-5', selected: false, onSelected: (value) => {}),
                TChoiceChip(text: 'UK-6', selected: false, onSelected: (value) => {}),
                TChoiceChip(text: 'UK-8', selected: false, onSelected: (value) => {}),
                TChoiceChip(text: 'UK-9', selected: true, onSelected: (value) => {}),
                TChoiceChip(text: 'UK-10', selected: false, onSelected: (value) => {}),
              ],
            ),
          ],
        )
      ],
    );
  }
}
