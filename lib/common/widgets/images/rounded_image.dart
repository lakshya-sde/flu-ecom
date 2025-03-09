import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width,
    this.height,
    required this.image,
    this.isNetworkImage = false,
    this.fit,
    this.applyImageRadius = true,
    this.border,
    this.borderRadius = TSizes.md,
    this.backgroundColor = TColors.light,
    this.padding,
    this.onPressed,
  });

  final bool isNetworkImage;
  final String image;
  final double? width, height;
  final BoxFit? fit;

  final bool applyImageRadius;
  final BoxBorder? border;
  final double borderRadius;

  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius:
              applyImageRadius
                  ? BorderRadius.circular(borderRadius)
                  : BorderRadius.zero,
          child: Image(
            image: isNetworkImage ? NetworkImage(image) : AssetImage(image),
            fit: fit,
          ),
        ),
      ),
    );
  }
}
