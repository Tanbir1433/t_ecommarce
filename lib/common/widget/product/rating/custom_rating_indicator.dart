
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class CustomRatingBarIndicator extends StatelessWidget {
  final double rating;
  const CustomRatingBarIndicator({
    super.key, required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemCount: 5,
      itemSize: 20,
      rating: rating,
      unratedColor: TColors.grey,
      itemBuilder: (_, index) => const Icon(
        Iconsax.star1,
        color: TColors.primary,
      ),
    );
  }
}
