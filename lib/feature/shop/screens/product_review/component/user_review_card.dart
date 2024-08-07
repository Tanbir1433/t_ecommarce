
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widget/product/rating/custom_rating_indicator.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({
    super.key,
  });

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
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage1),
                ),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Text('Tanbir',style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Review
        Row(
          children: [
            const CustomRatingBarIndicator(rating: 4),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text('01 Nov 2024',style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        
        const ReadMoreText(
            'A read receipt is essentially a small message that is sent between phones to indicate when someone has opened up your text thread,',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show Less',
          trimCollapsedText: 'Show More',
          moreStyle: TextStyle(fontWeight: FontWeight.w800,fontSize: 14,color: TColors.primary),
          lessStyle: TextStyle(fontWeight: FontWeight.w800,fontSize: 14,color: TColors.primary),
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        Material(
          color: dark ? TColors.darkerGrey : TColors.grey,
          borderRadius: BorderRadius.circular(TSizes.md),
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("T's Store",style: Theme.of(context).textTheme.titleMedium,),
                    Text("01 Nov 2021",style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                const ReadMoreText(
                  'A read receipt is essentially a small message that is sent between phones to indicate when someone has opened up your text thread,',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'Show Less',
                  trimCollapsedText: 'Show More',
                  moreStyle: TextStyle(fontWeight: FontWeight.w800,fontSize: 14,color: TColors.primary),
                  lessStyle: TextStyle(fontWeight: FontWeight.w800,fontSize: 14,color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        )
      ],
    );
  }
}
