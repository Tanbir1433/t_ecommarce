import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/image/circular_image.dart';
import 'package:t_store/common/widget/product/favourite_icon/favourite_icon.dart';
import 'package:t_store/common/widget/text/brand_title_verify_icon.dart';
import 'package:t_store/common/widget/text/product_price_text.dart';
import 'package:t_store/common/widget/text/product_title_text.dart';
import 'package:t_store/utils/constants/image_strings.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../circular_shape.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkGrey : TColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          SizedBox(
            height: 120,
            child: Material(
              borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
              color: dark ? TColors.dark : TColors.light,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Stack(
                  children: [
                    /// Thumbnail Image
                    const SizedBox(
                      height:120,
                        width: 120,
                        child: CircularImage(image: TImages.productImage7,fit: BoxFit.contain,)),

                    /// Sale tag
                    Positioned(
                      top: 12,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: CircularShape(
                          height: 20,
                          width: 40,
                          radius: TSizes.sm,
                          backgroundColor: TColors.secondary.withOpacity(0.8),
                          child: Center(
                              child: Text(
                                "15%",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .apply(color: TColors.black),
                              )),
                        ),
                      ),
                    ),

                    /// Favourite Icon
                    const Positioned(
                      top: 0,
                      right: 0,
                      child: FavouriteIcon(productId: '',),
                    ),

                  ],
                ),
              ),
            ),
          ),

          /// Details
          const SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.only(top: TSizes.sm,left: TSizes.sm),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(text: 'Green Nike Half Sleeves Shirt',smallSize: true,),
                      SizedBox(height: TSizes.spaceBtwItems / 2,),
                      BrandTitleWithVerifyIcon(title: 'Nike')
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      Flexible(child: ProductPriceText(price: '230')),

                      /// Add To Cart
                      Material(
                        color: TColors.dark,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.productImageRadius)
                        ),
                        child: SizedBox(
                            height: TSizes.iconLg * 1.2,
                            width: TSizes.iconLg * 1.2,
                            child: Icon(Iconsax.add,color: TColors.white,)),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
