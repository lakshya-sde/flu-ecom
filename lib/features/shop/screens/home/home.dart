import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/common/widgets/texts/section_heading.dart';
import 'package:flu_ecom/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flu_ecom/features/shop/screens/all_products/all_products.dart';
import 'package:flu_ecom/features/shop/screens/home/widgets/home_categories.dart';
import 'package:flu_ecom/features/shop/screens/home/widgets/home_promo_sliders.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/search_container.dart';
import 'package:flu_ecom/features/shop/screens/home/widgets/home_vertical_product_grid.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/primary_header_conatiner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header Section with App Bar,Search Bar and Categories
            PrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///App Bar
                  HomeAppbar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Search Bar
                  SearchBarContainer(text: 'Search in store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Search Bar & Categories
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        //Search Bar
                        SectionHeading(
                          title: 'Popular Categories',
                          textColor: TColors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),

                        //Categories
                        HomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Promo Slider
                  PromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Heading
                  SectionHeading(
                    title: 'Popular Products',
                    showActionButton: true,
                    onPressed: () => Get.to(AllProductsScreen()),
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),

                  ///Product Card Vertical
                  VerticalProductGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
