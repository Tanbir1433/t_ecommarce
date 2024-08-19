import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/image/circular_image.dart';
import 'package:t_store/common/widget/product/favourite_icon/favourite_icon.dart';
import 'package:t_store/common/widget/text/brand_title_verify_icon.dart';
import 'package:t_store/common/widget/text/product_price_text.dart';
import 'package:t_store/common/widget/text/product_title_text.dart';
import 'package:t_store/feature/shop/model/product_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';

import '../../../feature/shop/controllers/product/product_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../circular_shape.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
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
                    SizedBox(
                      height:120,
                        width: 120,
                        child: CircularImage(image: product.thumbnail,fit: BoxFit.contain,isNetworkImage: true,)),

                    /// Sale tag
                    if(salePercentage != null)
                      Positioned(
                        top: 12,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                          child: CircularShape(
                            height: 20,
                            width: 40,
                            radius: TSizes.sm,
                            backgroundColor: TColors.secondary.withOpacity(0.8),
                            child: Center(child: Text("$salePercentage%", style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),)),
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
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm,left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(text: product.title,smallSize: true,),
                      const SizedBox(height: TSizes.spaceBtwItems / 2,),
                      BrandTitleWithVerifyIcon(title: product.brand!.name)
                    ],
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
          )
        ],
      ),
    );
  }
}
