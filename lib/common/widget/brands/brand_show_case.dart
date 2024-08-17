import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/feature/shop/model/brand_model.dart';
import 'package:t_store/feature/shop/screens/brands/brands_product.dart';
import 'package:t_store/utils/shimmer/tshimmer_effect.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'brand_card.dart';

class BrandShowCase extends StatelessWidget {
  final List<String> images;
  final BrandModel brand;

  const BrandShowCase({
    super.key, required this.images, required this.brand,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: InkWell(
        onTap: () => Get.to(() => BrandsProduct(brand: brand)),
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
                BrandCard(showBanner: false, brand: brand),

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
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.contain,
                progressIndicatorBuilder: (context, url, downloadProgress) => const TShimmerEffect(width: 100, height: 100),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
      ),
    );
  }
}