import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/utils/device/device_utility.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key,
    required this.rating,
    this.totalRating = 5,
  });

  final int rating;
  final int totalRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text('$rating', style: Theme.of(context).textTheme.bodyMedium)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: TDeviceUtils.getScreenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              value: (rating / totalRating),
              minHeight: 11,
              backgroundColor: TColors.grey,
              borderRadius: BorderRadius.circular(7),
              valueColor: AlwaysStoppedAnimation(TColors.primary),
            ),
          ),
        )
      ],
    );
  }
}
