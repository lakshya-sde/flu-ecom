import 'package:flu_ecom/common/widgets/success_screens/success_screen.dart';
import 'package:flu_ecom/navigation_menu.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/common/widgets/appbar/appbar.dart';
import 'package:flu_ecom/utils/helpers/helper_functions.dart';
import 'package:flu_ecom/common/widgets/products/cart/coupon_widget.dart';
import 'package:flu_ecom/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:flu_ecom/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:flu_ecom/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:flu_ecom/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// -- Items in Cart
            CartItems(showAddRemoveButtons: false),
            SizedBox(height: TSizes.spaceBtwSections),

            /// -- Coupon TextField
            CouponWidget(),
            SizedBox(height: TSizes.spaceBtwSections),

            /// -- Billing Counter
            TRoundedContainer(
              showBorder: true,
              padding: EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.black : TColors.white,
              child: Column(
                children: [
                  /// Pricing
                  BillingAmountSection(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// Divider
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// Payment Methods
                  BillingPaymentSection(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// Addresses
                  BillingAddressSection(),
                ],
              ),
            ),
          ],
        ),
      ),

      /// Checkout button
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            SuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: 'Payment Success',
              subtitle: 'Your item will be shipped soon!',
              onPressed: () => Get.offAll(NavigationMenu()),
            ),
          ),
          child: Text('Checkout \$1099.2'),
        ),
      ),
    );
  }
}
