import 'package:flu_ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/colors.dart';

class TFormDivider extends StatelessWidget {
  final String dividerText;
  const TFormDivider({super.key, required this.dividerText});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Left part
        Flexible(child: Divider(color: dark ? TColors.darkGrey : TColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),

        //Center
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),

        //Right part
        Flexible(child: Divider(color: dark ? TColors.darkGrey : TColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
      ],
    );
  }
}
