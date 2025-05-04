import 'package:flu_ecom/common/widgets/skeleton/shimmer_effect.dart';
import 'package:flu_ecom/features/authentication/controllers/user/user_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/utils/constants/text_strings.dart';
import 'package:flu_ecom/common/widgets/appbar/appbar.dart';
import 'package:flu_ecom/features/shop/screens/cart/cart.dart';
import 'package:flu_ecom/common/widgets/products/cart/cart_menu_icon.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: TColors.grey),
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                // skeleton loading
                return ShimmerEffect(width: 80, height: 15);
              } else {
                // display user's name
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall!.apply(color: TColors.white),
                );
              }
            },
          ),
        ],
      ),
      actions: [
        CartCounterIcon(onPressed: () => Get.to(CartScreen()), iconColor: TColors.white),
      ],
    );
  }
}
