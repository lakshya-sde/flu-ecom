import 'package:flu_ecom/common/widgets/brands/brand_showcase.dart';
import 'package:flu_ecom/common/widgets/layouts/grid_layout.dart';
import 'package:flu_ecom/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flu_ecom/common/widgets/texts/section_heading.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              BrandShowcase(images: [TImages.productImage1, TImages.productImage2, TImages.productImage3]),
              BrandShowcase(images: [TImages.productImage1, TImages.productImage2, TImages.productImage3]),
              SizedBox(height: TSizes.spaceBtwItems),

              /// -- Products
              SectionHeading(title: 'You might like', showActionButton: true, onPressed: () {}),
              SizedBox(height: TSizes.spaceBtwItems),

              GridLayout(
                itemCount: 8,
                itemBuilder:
                    (_, index) => ProductCardVertical(
                      onTap: () {},
                      image: TImages.productImage2,
                      title: 'Nike Shoes',
                      brand: 'Nike',
                      price: 1999.2,
                    ),
              ),
              // SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
