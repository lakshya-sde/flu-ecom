import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/common/widgets/custom_shapes/container/rounded_container.dart';

class SaleBadge extends StatelessWidget {
  const SaleBadge({super.key, required this.sale});

  final int sale;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      child: TRoundedContainer(
        radius: TSizes.sm,
        backgroundColor: TColors.secondary.withValues(alpha: 0.8),
        padding: EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
        child: Text('${sale}%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
      ),
    );
  }
}
