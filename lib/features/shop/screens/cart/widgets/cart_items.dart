import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/common/widgets/products/cart/cart_item.dart';
import 'package:flu_ecom/common/widgets/texts/product_price_text.dart';
import 'package:flu_ecom/common/widgets/products/cart/add_remove_btn_with_qty.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 2,
      shrinkWrap: true, 
      separatorBuilder: (_, __) => SizedBox(
        height: TSizes.spaceBtwItems,
      ),
      itemBuilder: (_, index) => Column(
        children: [
          //Product Item
          CartItem(),
          if (showAddRemoveButtons) SizedBox(height: TSizes.spaceBtwItems),

          if (showAddRemoveButtons)
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
    );
  }
}
