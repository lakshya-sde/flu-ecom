import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flu_ecom/navigation_menu.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/common/widgets/appbar/appbar.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/common/widgets/layouts/grid_layout.dart';
import 'package:flu_ecom/common/widgets/icons/circular_icon.dart';
import 'package:flu_ecom/features/shop/screens/product-details/product_detail.dart';
import 'package:flu_ecom/common/widgets/products/product_cards/product_card_vertical.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [CircularIcon(icon: Iconsax.add, onPressed: () => Get.to(NavigationMenu()))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              GridLayout(
                itemCount: 16,
                itemBuilder: (_, index) => ProductCardVertical(
                  onTap: () => Get.to(ProductDetailScreen()),
                  image: TImages.productImage23,
                  title: 'Nike Black & Red Sneakers for Men',
                  brand: 'Nike',
                  price: 1299,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
