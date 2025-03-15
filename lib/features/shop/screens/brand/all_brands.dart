import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/common/widgets/appbar/appbar.dart';
import 'package:flu_ecom/common/widgets/layouts/grid_layout.dart';
import 'package:flu_ecom/common/widgets/texts/section_heading.dart';
import 'package:flu_ecom/features/shop/screens/brand/brand_products.dart';
import 'package:flu_ecom/common/widgets/brands/brand_cards/brand_card.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              SectionHeading(title: 'Brands'),
              SizedBox(height: TSizes.spaceBtwItems),

              /// -- Brands
              GridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (_, index) => BrandCard(
                  showBorder: true,
                  brand: 'Puma',
                  onTap: () => Get.to(BrandProducts()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
