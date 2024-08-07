import 'package:flutter/material.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/utils/constants/sizes.dart';
import '../../../../common/widget/product/rating/custom_rating_indicator.dart';
import 'component/over_all_product_rating.dart';
import 'component/user_review_card.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        showBackArrow: true,
        title: Text("Reviews & Rating"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Rating Text is text based on the rating that the respondent attained based on their score. Rating Text is available at four levels"),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Overall Product Rating
              const OverAllProductRating(),
              const CustomRatingBarIndicator(rating: 3.5,),
              Text('12,677',style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// user Review List
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
