import 'package:flu_ecom/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/common/styles/shadows.dart';
import 'package:flu_ecom/utils/helpers/helper_functions.dart';
import 'package:flu_ecom/common/widgets/icons/circular_icon.dart';
import 'package:flu_ecom/common/widgets/texts/product_title.dart';
import 'package:flu_ecom/common/widgets/images/rounded_image.dart';
import 'package:flu_ecom/common/widgets/texts/product_price_text.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/rounded_container.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
    required this.brand,
    required this.price,
  });

  final void Function() onTap;
  final String image, title, brand;
  final double price;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            ///Thumbnail, Wishlist Button, Discount tag
            TRoundedContainer(
              height: 180,
              padding: EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// - Thumbnail Image
                  RoundedImage(image: image, applyImageRadius: true),

                  /// - Sales Badge
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withValues(alpha: 0.8),
                      padding: EdgeInsets.symmetric(
                        horizontal: TSizes.sm,
                        vertical: TSizes.xs,
                      ),
                      child: Text(
                        '25%',
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: TColors.black),
                      ),
                    ),
                  ),

                  /// Favourite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems / 2),

            ///Details Section
            Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// - Product Title
                    ProductTitleText(text: title, smallSize: true),
                    SizedBox(height: TSizes.spaceBtwItems / 2),

                    /// - Brand Name
                    BrandTitleTextWithVerifiedIcon(
                      title: brand,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),

            Spacer(), //middle spacing

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: ProductPriceText(price: price.toString()),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: TColors.white,
                        size: TSizes.iconSm,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
