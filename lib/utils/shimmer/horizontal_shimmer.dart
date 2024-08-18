import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/shimmer/tshimmer_effect.dart';

class HorizontalShimmer extends StatelessWidget {
  const HorizontalShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems,),
        itemBuilder: (_,__) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TShimmerEffect(width: 120, height: 120),
            SizedBox(width: TSizes.spaceBtwItems,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: TSizes.spaceBtwItems/2),
                TShimmerEffect(width: 10, height: 10),
              ],
            )
          ],
        ),
        ),
    );
  }
}
