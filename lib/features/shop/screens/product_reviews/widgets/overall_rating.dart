import 'package:flu_ecom/features/shop/screens/product_reviews/widgets/progress_rating_indicator.dart';
import 'package:flutter/material.dart';

class OverallRating extends StatelessWidget {
  const OverallRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // -- Rating Count
        Expanded(flex: 3, child: Text('4.8', style: Theme.of(context).textTheme.displayLarge)),

        // -- Rating Indicators
        Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingProgressIndicator(rating: 5),
              RatingProgressIndicator(rating: 4),
              RatingProgressIndicator(rating: 3),
              RatingProgressIndicator(rating: 2),
              RatingProgressIndicator(rating: 1),
            ],
          ),
        )
      ],
    );
  }
}
