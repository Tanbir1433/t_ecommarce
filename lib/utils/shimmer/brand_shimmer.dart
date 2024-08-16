import 'package:flutter/cupertino.dart';
import 'package:t_store/common/widget/layout/grid_layout.dart';
import 'package:t_store/utils/shimmer/tshimmer_effect.dart';

class BrandShimmer extends StatelessWidget {
  const BrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
        mainAxisExtent: 80,
        itemCount: itemCount,
        itemBuilder: (_, __) => const TShimmerEffect(width: 300, height: 80));
  }
}
