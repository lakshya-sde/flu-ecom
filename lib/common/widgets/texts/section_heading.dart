import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/colors.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.title,
    this.textColor = TColors.white,
    this.showActionButton = false,
    this.buttonTitle = 'View All',
    this.onPressed,
  });

  final String title;
  final Color? textColor;
  final bool showActionButton;
  final String? buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle!)),
      ],
    );
  }
}
