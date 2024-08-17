import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/style/shadow.dart';
import 'package:t_store/common/widget/circular_shape.dart';
import 'package:t_store/common/widget/image/circular_image.dart';
import 'package:t_store/common/widget/product/favourite_icon/favourite_icon.dart';
import 'package:t_store/feature/shop/controllers/product/product_controller.dart';
import 'package:t_store/feature/shop/model/product_model.dart';
import 'package:t_store/feature/shop/screens/product_detail/product_detail_screen.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../text/brand_title_verify_icon.dart';
import '../text/product_price_text.dart';
import '../text/product_title_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailScreen(
              product: product,
            ));
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
              width: 180,
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  Center(
                      child: CircularImage(
                    image: product.thumbnail,
                    isNetworkImage: true,
                    height: double.infinity,
                    width: double.infinity,
                    borderRadius: 12,
                  )),

                  /// Sale tag
                  if(salePercentage != null)
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
                          "$salePercentage%",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.black),
                        )),
                      ),
                    ),
                  ),

                  /// Favourite Icon
                  Positioned(
                    top: 0,
                    right: 0,
                    child: FavouriteIcon(productId: product.id,),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            /// Detail
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductTitleText(
                      text: product.title,
                      smallSize: true,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    BrandTitleWithVerifyIcon(
                      title: product.brand!.name,
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price and Discount Price
                Flexible(
                  child: Column(
                    children: [
                      /// Discount Price
                      if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: TSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),

                      /// Price
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: ProductPriceText(price: controller.getProductPrice(product)),
                      ),
                    ],
                  ),
                ),

                /// Add To Cart Button
                const Material(
                  color: TColors.dark,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius)),
                  child: SizedBox(
                      height: TSizes.iconLg * 1.2,
                      width: TSizes.iconLg * 1.2,
                      child: Icon(
                        Iconsax.add,
                        color: TColors.white,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
