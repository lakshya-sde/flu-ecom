import 'package:flu_ecom/common/widgets/appbar/appbar.dart';
import 'package:flu_ecom/common/widgets/brands/brand_cards/brand_card.dart';
import 'package:flu_ecom/common/widgets/products/sortable/sortable_products.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Nike'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Brand Details
              BrandCard(showBorder: true, brand: 'Puma'),
              SizedBox(height: TSizes.spaceBtwSections),

              // products
              SortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
