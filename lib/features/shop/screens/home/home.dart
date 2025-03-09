import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/common/widgets/texts/section_heading.dart';
import 'package:flu_ecom/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flu_ecom/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/search_container.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/primary_header_conatiner.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> categories = [
    {'image': TImages.jeweleryIcon, 'title': 'Jewelery'},
    {'image': TImages.electronicsIcon, 'title': 'Electronics'},
    {'image': TImages.furnitureIcon, 'title': 'Furniture'},
    {'image': TImages.sportIcon, 'title': 'Sports'},
    {'image': TImages.shoeIcon, 'title': 'Shoe'},
    {'image': TImages.clothIcon, 'title': 'Cloth'},
    {'image': TImages.cosmeticsIcon, 'title': 'Cosmetics'},
    {'image': TImages.animalIcon, 'title': 'Animal'},
    {'image': TImages.toyIcon, 'title': 'Toy'},
  ];

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
                            itemCount: categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return VerticalImageText(
                                image: categories[index]['image'],
                                title: categories[index]['title'],
                                onTap: () {},
                              );
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
