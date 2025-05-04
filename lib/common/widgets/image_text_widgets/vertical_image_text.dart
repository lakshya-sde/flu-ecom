import 'package:flu_ecom/common/widgets/images/circular_image.dart';
import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/helpers/helper_functions.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.title,
    required this.image,
    this.textColor = TColors.white,
    this.onTap,
    this.backgroundColor,
    this.isNetworkImage = true,
  });

  final String image;
  final String title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            //Circular Icon
            CircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: TSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
            ),
            // Container(
            //   width: 56,
            //   height: 56,
            //   padding: EdgeInsets.all(TSizes.sm),
            //   decoration: BoxDecoration(
            //     color: backgroundColor ?? (dark ? TColors.black : TColors.white),
            //     borderRadius: BorderRadius.circular(100),
            //   ),
            //   child: Center(
            //     child: Image(
            //       image: AssetImage(image),
            //       fit: BoxFit.cover,
            //       color: dark ? TColors.light : TColors.dark,
            //     ),
            //   ),
            // ),
            SizedBox(height: TSizes.spaceBtwItems / 2),

            //Text
            SizedBox(
              width: 60,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium!.apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
