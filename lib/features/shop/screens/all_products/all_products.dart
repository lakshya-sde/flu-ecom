import 'package:flu_ecom/common/widgets/layouts/grid_layout.dart';
import 'package:flu_ecom/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/common/widgets/appbar/appbar.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Popular Products', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Dropdown
              DropdownButtonFormField(
                decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                onChanged: (val) {},
                items: ['Name', 'Higher Price', 'Lowe Price', 'Sale', 'Newest', 'Popularity']
                    .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              /// Products
              GridLayout(
                itemCount: 20,
                itemBuilder: (_, index) => ProductCardVertical(
                  onTap: () {},
                  image: TImages.productImage1,
                  title: 'Nike Green - White Shoes For Mens',
                  brand: 'Nike',
                  price: 299,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
