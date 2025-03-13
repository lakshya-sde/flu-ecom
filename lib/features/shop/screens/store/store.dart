import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/common/widgets/appbar/appbar.dart';
import 'package:flu_ecom/common/widgets/appbar/tabbar.dart';
import 'package:flu_ecom/utils/helpers/helper_functions.dart';
import 'package:flu_ecom/features/shop/screens/cart/cart.dart';
import 'package:flu_ecom/common/widgets/layouts/grid_layout.dart';
import 'package:flu_ecom/common/widgets/texts/section_heading.dart';
import 'package:flu_ecom/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:flu_ecom/common/widgets/brands/brand_cards/brand_card.dart';
import 'package:flu_ecom/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/search_container.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            CartCounterIcon(
              onPressed: () => Get.to(CartScreen()),
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, index) => [
            SliverAppBar(
              pinned: true,
              floating: true,
              backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
              expandedHeight: 440,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ///Search Bar
                    SizedBox(height: TSizes.spaceBtwItems),
                    SearchBarContainer(text: 'Search in Store', showBackground: false, padding: EdgeInsets.zero),
                    SizedBox(height: TSizes.spaceBtwSections),

                    ///Featured Brands
                    SectionHeading(title: 'Featured Brands', onPressed: () {}, showActionButton: true),
                    SizedBox(height: TSizes.spaceBtwItems / 1.5),

                    /// - Featured Brand Cards
                    GridLayout(
                      itemCount: 4,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        return BrandCard(showBorder: true, brand: 'Nike');
                      },
                    ),
                  ],
                ),
              ),

              ///Tabs - Tutorial
              bottom: TTabBar(
                tabs: [
                  Tab(child: Text('Sports')),
                  Tab(child: Text('Furniture')),
                  Tab(child: Text('Electronics')),
                  Tab(child: Text('Clothes')),
                  Tab(child: Text('Cosmetics')),
                ],
              ),
            ),
          ],
          body: TabBarView(children: [CategoryTab(), CategoryTab(), CategoryTab(), CategoryTab(), CategoryTab()]),
        ),
      ),
    );
  }
}
