import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/common/widgets/appbar/appbar.dart';
import 'package:flu_ecom/common/widgets/products/rating/rating_stars_indicator.dart';
import 'package:flu_ecom/features/shop/screens/product_reviews/widgets/overall_rating.dart';
import 'package:flu_ecom/features/shop/screens/product_reviews/widgets/user_review_card.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Heading
              Text('Ratings and reviews are verified and are from people who use the same type of device that you use.'),
              SizedBox(height: TSizes.spaceBtwItems),

              /// -- Overall Rating
              OverallRating(),
              RatingStarsIndicator(rating: 4.7),
              Text("12, 661", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: TSizes.spaceBtwSections),

              /// -- User Reviews List
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
