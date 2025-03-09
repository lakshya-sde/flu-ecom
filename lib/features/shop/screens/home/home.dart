import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/common/widgets/texts/section_heading.dart';
import 'package:flu_ecom/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flu_ecom/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/search_container.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/primary_header_conatiner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///App Bar
                  HomeAppbar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Search Bar
                  SearchBarContainer(text: 'Search in store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Search Bar & Categories
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        //Search Bar
                        SectionHeading(title: 'Popular Categories'),
                        SizedBox(height: TSizes.spaceBtwItems),

                        //Categories
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return VerticalImageText(image: TImages.shoeIcon, title: 'Shoes', onTap: () {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
