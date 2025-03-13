import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/common/widgets/appbar/appbar.dart';
import 'package:flu_ecom/common/widgets/products/cart/cart_item.dart';
import 'package:flu_ecom/common/widgets/texts/product_price_text.dart';
import 'package:flu_ecom/common/widgets/products/cart/add_remove_btn_with_qty.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),

        /// Items
        child: ListView.separated(
          itemCount: 12,
          shrinkWrap: true,
          separatorBuilder: (_, __) => SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          itemBuilder: (_, index) => Column(
            children: [
              //Product Item
              CartItem(),
              SizedBox(height: TSizes.spaceBtwItems),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Add or Remove, Quantity Buttons
                  Row(
                    children: [
                      // Extra Space
                      SizedBox(width: 70),
                      // Buttons
                      AddRemoveButtonWithQty(),
                    ],
                  ),

                  /// Price
                  ProductPriceText(price: '299'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Checkout \$1990.0'),
        ),
      ),
    );
  }
}
