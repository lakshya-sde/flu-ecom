import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
    required this.image,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.overlayColor,
    this.isNetworkImage = false,
  });

  final double width;
  final double height;
  final double padding;
  final String image;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final Color? overlayColor;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? TColors.black : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        fit: fit,
        image: isNetworkImage ? NetworkImage(image) : AssetImage(image),
        color: overlayColor,
      ),
    );
  }
}
