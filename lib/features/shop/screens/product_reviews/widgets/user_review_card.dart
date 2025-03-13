import 'package:flu_ecom/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:flu_ecom/common/widgets/products/rating/rating_stars_indicator.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage1)),
                SizedBox(width: TSizes.spaceBtwItems),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),

        /// Review
        Row(
          children: [
            RatingStarsIndicator(rating: 4),
            SizedBox(width: TSizes.spaceBtwItems),
            Text('01 Apr, 2025', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

        SizedBox(height: TSizes.spaceBtwItems),
        ReadMoreText(
          'The UI of the app is quite intutive. I was able to navigate and make purchase seamlessly. Great job! I was able to navigate and make purchase',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),
        SizedBox(height: TSizes.spaceBtwItems),

        /// Company Review
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("L's Store", style: Theme.of(context).textTheme.titleMedium),
                    Text("03 Apr, 2025", style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwItems),
                ReadMoreText(
                  'The UI of the app is quite intutive. I was able to navigate and make purchase seamlessly. Great job! I was able to navigate and make purchase',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
