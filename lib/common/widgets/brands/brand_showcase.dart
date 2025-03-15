import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/utils/helpers/helper_functions.dart';
import 'package:flu_ecom/common/widgets/brands/brand_cards/brand_card.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/rounded_container.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: EdgeInsets.all(TSizes.md),
      child: Column(
        children: [
          ///Brand with Products Count
          BrandCard(showBorder: false, brand: 'Adidas'),
          SizedBox(height: TSizes.spaceBtwItems),

          ///Brand Top #3 Product Images
          Row(children: images.map((img) => brandTopProductImage(img, context)).toList()),
        ],
      ),
    );
  }

  Widget brandTopProductImage(String image, BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Expanded(
      child: TRoundedContainer(
        height: 100,
        padding: EdgeInsets.all(TSizes.md),
        backgroundColor: dark ? TColors.darkerGrey : TColors.light,
        margin: EdgeInsets.only(right: TSizes.sm),
        child: Image(fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}
