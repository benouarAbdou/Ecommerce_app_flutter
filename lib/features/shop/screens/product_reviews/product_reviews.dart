import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/products/rating_bar_indicator.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/progress_indicator_rating.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProductReviesScreen extends StatelessWidget {
  const ProductReviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Reviews and ratings"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Ratings and reviews are verified by someone i dont know who but anuways"),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 4.8),
              Text("12.611", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
