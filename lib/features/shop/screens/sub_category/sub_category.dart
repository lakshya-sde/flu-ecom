import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/common/widgets/appbar/appbar.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/common/widgets/images/rounded_image.dart';
import 'package:flu_ecom/common/widgets/texts/section_heading.dart';
import 'package:flu_ecom/features/shop/screens/all_products/all_products.dart';
import 'package:flu_ecom/common/widgets/products/product_cards/product_card_horizontal.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Bannner
              RoundedImage(width: double.infinity, image: TImages.banner3, applyImageRadius: true),
              SizedBox(height: TSizes.spaceBtwSections),

              /// Sub-Categories
              Column(
                children: [
                  /// Heading
                  SectionHeading(
                    title: 'Sports shoes',
                    showActionButton: true,
                    onPressed: () => Get.to(AllProductsScreen()),
                  ),
                  SizedBox(height: TSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      separatorBuilder: (_, __) => SizedBox(width: TSizes.spaceBtwItems),
                      itemBuilder: (_, index) {
                        return ProductCardHorizontal(
                          image: TImages.productImage1,
                          title: 'Nike Green Sport Shoes Mens',
                          brand: 'Nike',
                          price: 299.99,
                        );
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: TSizes.spaceBtwSections),

              Column(
                children: [
                  /// Heading
                  SectionHeading(
                    title: 'Sports Equipments',
                    showActionButton: true,
                    onPressed: () => Get.to(AllProductsScreen()),
                  ),
                  SizedBox(height: TSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      separatorBuilder: (_, __) => SizedBox(width: TSizes.spaceBtwItems),
                      itemBuilder: (_, index) {
                        return ProductCardHorizontal(
                          image: TImages.productImage28,
                          title: 'Cosco Red - White Football',
                          brand: 'Cosco',
                          price: 299.99,
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
