import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/common/widgets/appbar/appbar.dart';
import 'package:flu_ecom/features/shop/screens/cart/cart.dart';
import 'package:flu_ecom/common/widgets/texts/section_heading.dart';
import 'package:flu_ecom/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:flu_ecom/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:flu_ecom/features/personalization/screens/profile/profile.dart';
import 'package:flu_ecom/features/personalization/screens/address/address.dart';
import 'package:flu_ecom/features/personalization/controllers/setting_controller.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/primary_header_conatiner.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final bool switch1 = true, switch2 = true, switch3 = false;
    final controller = Get.put(SettingController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  TAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),
                    ),
                  ),

                  /// User Profile Card
                  UserProfileTile(onPressed: () => Get.to(ProfileScreen())),

                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// -- Body
            Obx(() {
              return Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    /// -- Account Settings
                    SectionHeading(title: 'Account Settings'),
                    SizedBox(height: TSizes.spaceBtwItems),

                    SettingMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Address',
                      subtitle: 'Set Shopping delivery address',
                      onTap: () => Get.to(AddressScreen()),
                    ),
                    SettingMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subtitle: 'Add, remove products and move to checkout',
                      onTap: () => Get.to(CartScreen()),
                    ),
                    SettingMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subtitle: 'In-progress and Completed Orders',
                    ),
                    SettingMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subtitle: 'Withdraw balance to registered bank account',
                    ),
                    SettingMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subtitle: 'List of all the discounted coupons',
                    ),
                    SettingMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subtitle: 'Set and kind of notification message',
                    ),
                    SettingMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subtitle: 'Manage data usage and connected accounts',
                    ),

                    /// -- App Settings
                    SizedBox(height: TSizes.spaceBtwSections),
                    SectionHeading(title: 'App Settings', showActionButton: false),
                    SizedBox(height: TSizes.spaceBtwItems),
                    SettingMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subtitle: 'Upload Data to your Cloud Firebase',
                    ),

                    /// Switchers
                    SettingMenuTile(
                      icon: Iconsax.location,
                      title: 'Geolocation',
                      subtitle: 'Set recommendations based on location',
                      trailing: Switch(
                        value: controller.switch1.value,
                        onChanged: (value) => controller.toggleSwitch1(value),
                      ),
                    ),

                    SettingMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Safe Mode',
                      subtitle: 'Search result is safe for all ages',
                      trailing: Switch(
                        value: controller.switch2.value,
                        onChanged: (value) => controller.toggleSwitch2(value),
                      ),
                    ),
                    SettingMenuTile(
                      icon: Iconsax.image,
                      title: 'HD Image Quality',
                      subtitle: 'Set image quality to be seen',
                      trailing: Switch(
                        activeColor: TColors.white,
                        value: controller.switch3.value,
                        onChanged: (value) => controller.toggleSwitch3(value),
                      ),
                    ),
                    SizedBox(height: TSizes.spaceBtwSections),

                    ///Logout Button
                    SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () {}, child: Text('Logout'))),
                    SizedBox(height: TSizes.spaceBtwSections * 2.5),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
