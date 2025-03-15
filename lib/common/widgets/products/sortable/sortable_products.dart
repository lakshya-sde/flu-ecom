import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/common/widgets/layouts/grid_layout.dart';
import 'package:flu_ecom/features/shop/screens/product-details/product_detail.dart';
import 'package:flu_ecom/common/widgets/products/product_cards/product_card_vertical.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            onTap: () => Get.to(ProductDetailScreen()),
            image: TImages.productImage1,
            title: 'Nike Green - White Shoes For Mens',
            brand: 'Nike',
            price: 299,
          ),
        )
      ],
    );
  }
}
