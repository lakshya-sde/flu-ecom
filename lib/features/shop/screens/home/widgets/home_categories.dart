import 'package:flu_ecom/common/widgets/skeleton/category_shimmer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/features/shop/controllers/category_controller.dart';
import 'package:flu_ecom/features/shop/screens/sub_category/sub_category.dart';
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
    final categoryController = Get.put(CategoryController());

    
    return Obx(() {
      if(categoryController.isLoading.value) return CategoryShimmer();

      if(categoryController.featuredCategories.isEmpty) {
        return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
      }

      return  SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return VerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(SubCategoryScreen()),
            );
          },
        ),
      );
    });
  }
}
