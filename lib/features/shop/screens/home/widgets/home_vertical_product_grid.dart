import 'package:flu_ecom/features/shop/screens/product-details/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/common/widgets/layouts/grid_layout.dart';
import 'package:flu_ecom/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:get/get.dart';

class VerticalProductGrid extends StatelessWidget {
  VerticalProductGrid({super.key});

  final List<Map<String, dynamic>> products = [
    {
      'title': 'Green Nike Air Shoes',
      'brand': 'Nike',
      'price': 1099.25,
      'image': TImages.productImage1,
    },
    {
      'title': 'Black Puma Sneaker',
      'brand': 'Puma',
      'price': 1225.18,
      'image': TImages.productImage2,
    },
    {
      'title': 'Adidas Leather Grey Jacket',
      'brand': 'Adidas',
      'price': 299.16,
      'image': TImages.productImage3,
    },
    {
      'title': 'Levis Denim Baggy Jeans',
      'brand': 'Levis',
      'price': 799.16,
      'image': TImages.productImage4,
    },
    {
      'title': 'Adidas Blue Oversized Tshirt',
      'brand': 'Adidas',
      'price': 99.16,
      'image': TImages.productImage5,
    },
    {
      'title': 'Nike',
      'brand': 'NIke',
      'price': 2999.16,
      'image': TImages.productImage6,
    },
    {
      'title': 'Adidas Leather Grey Jacket',
      'brand': 'Adidas',
      'price': 299.16,
      'image': TImages.productImage7,
    },
    {
      'title': 'Adidas Leather Grey Jacket',
      'brand': 'Adidas',
      'price': 299.16,
      'image': TImages.productImage8,
    },
    {
      'title': 'Adidas Leather Grey Jacket',
      'brand': 'Adidas',
      'price': 299.16,
      'image': TImages.productImage9,
    },
    {
      'title': 'Adidas Leather Grey Jacket',
      'brand': 'Adidas',
      'price': 299.16,
      'image': TImages.productImage10,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: products.length,
      itemBuilder: (_, index) => ProductCardVertical(
        title: products[index]['title'],
        brand: products[index]['brand'],
        price: products[index]['price'],
        image: products[index]['image'],
        onTap: () => Get.to(ProductDetailScreen()),
      ),
    );
  }
}
