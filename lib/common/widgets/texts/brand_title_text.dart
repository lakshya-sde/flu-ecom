import 'package:flu_ecom/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key,
    this.color,
    this.maxLines = 1,
    required this.title,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    TextStyle getTextStyle() {
      final TextTheme textTheme = Theme.of(context).textTheme;

      if (brandTextSize == TextSizes.small) {
        return textTheme.labelMedium!.apply(color: color);
      } else if (brandTextSize == TextSizes.medium) {
        return textTheme.bodyLarge!.apply(color: color);
      } else if (brandTextSize == TextSizes.large) {
        return textTheme.titleLarge!.apply(color: color);
      } else {
        return textTheme.bodyMedium!.apply(color: color);
      }
    }

    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: getTextStyle(),
    );
  }
}
