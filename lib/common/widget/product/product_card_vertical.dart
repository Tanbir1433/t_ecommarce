import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/style/shadow.dart';
import 'package:t_store/common/widget/circular_shape.dart';
import 'package:t_store/common/widget/image/banner_image.dart';
import 'package:t_store/feature/shop/screens/product_detail/product_detail_screen.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../icon/circular_icon.dart';
import '../text/brand_title_verify_icon.dart';
import '../text/product_price_text.dart';
import '../text/product_title_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: (){
        Get.to(() => const ProductDetailScreen());
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          border: Border.all(
            color: dark ? TColors.darkGrey : TColors.white,
            width: 1.5,
          ),
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail
            CircularShape(
              height: 180,
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Product Image
                  const BannerImage(imageUrl: TImages.productImage22,width: double.maxFinite,),

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
                    child: CircularIcon(
                      icon: Iconsax.heart5,
                      iconColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            /// Detail
            const Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(text: "Green Nike Air Shoes",smallSize: true,),
                  SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  BrandTitleWithVerifyIcon(title: 'Nike',),
                ],
              ),
            ),

            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                Padding(
                  padding: EdgeInsets.only(left: TSizes.sm),
                  child: ProductPriceText(price: '38.0'),
                ),

                /// Add To Cart Button
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
    );
  }
}
