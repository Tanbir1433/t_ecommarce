import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'brand_card.dart';

class BrandShowCase extends StatelessWidget {
  final List<String> images;


  const BrandShowCase({
    super.key, required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(TSizes.cardRadiusLg),
          side: const BorderSide(color: TColors.darkGrey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              /// Brands With Product Count
              const BrandCard(showBanner: false),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Brand Top 3 Images
              Row(
                children: images.map((image) => brandTopProductImage(image, context)).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget brandTopProductImage(String image, context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: SizedBox(
          height: 100,
          child: Material(
            color: THelperFunctions.isDarkMode(context) ? TColors.darkGrey : TColors.light,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            clipBehavior: Clip.hardEdge,
            child: Padding(
              padding: const EdgeInsets.all(TSizes.buttonRadius),
              child: Image(
                fit: BoxFit.contain,
                image: AssetImage(image),
              ),
            ),

          ),
        ),
      ),
    );
  }
}