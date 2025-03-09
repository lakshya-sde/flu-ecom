import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/enums.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/common/widgets/appbar/appbar.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/utils/helpers/helper_functions.dart';
import 'package:flu_ecom/common/widgets/images/circular_image.dart';
import 'package:flu_ecom/common/widgets/texts/section_heading.dart';
import 'package:flu_ecom/common/widgets/layouts/grid_layout.dart';
import 'package:flu_ecom/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/search_container.dart';
import 'package:flu_ecom/common/widgets/texts/brand_title_text_with_verified_icon.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: [CartCounterIcon(onPressed: () {})],
      ),
      body: NestedScrollView(
        headerSliverBuilder:
            (_, index) => [
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context) ? Colors.transparent : TColors.white,
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

                      /// - Brand Card
                      GridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: TRoundedContainer(
                              padding: EdgeInsets.all(TSizes.sm),
                              showBorder: true,
                              backgroundColor: Colors.transparent,
                              child: Row(
                                children: [
                                  /// -- Icon
                                  Flexible(
                                    child: CircularImage(
                                      image: TImages.clothIcon,
                                      backgroundColor: Colors.transparent,
                                      overlayColor: dark ? TColors.white : TColors.black,
                                    ),
                                  ),
                                  SizedBox(width: TSizes.spaceBtwItems / 2),

                                  /// -- Text
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        BrandTitleTextWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large),
                                        Text(
                                          '256 products',
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context).textTheme.labelMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
        body: Container(),
      ),
    );
  }
}
