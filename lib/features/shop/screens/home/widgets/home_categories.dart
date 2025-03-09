import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/common/widgets/image_text_widgets/vertical_image_text.dart';

class HomeCategories extends StatelessWidget {
  HomeCategories({super.key});

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
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return VerticalImageText(image: categories[index]['image'], title: categories[index]['title'], onTap: () {});
        },
      ),
    );
  }
}
