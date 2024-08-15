import 'package:flutter/material.dart';
import 'package:t_store/common/widget/layout/grid_layout.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/shimmer/tshimmer_effect.dart';

class VerticalShimmer extends StatelessWidget {
  const VerticalShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
        itemCount: itemCount,
        itemBuilder: (_,__) => const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TShimmerEffect(width: 180, height: 180),
              SizedBox(height: TSizes.spaceBtwItems,),
              TShimmerEffect(width: 160, height: 15),
              SizedBox(height: TSizes.spaceBtwItems/2),
              TShimmerEffect(width: 110, height: 15),
            ],
          ),
        ));
  }
}
