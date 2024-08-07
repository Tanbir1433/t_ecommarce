import 'package:flutter/material.dart';
import 'package:t_store/common/widget/icon/circular_icon.dart';
import 'package:t_store/common/widget/image/circular_image.dart';
import 'package:t_store/common/widget/text/brand_title_verify_icon.dart';
import 'package:t_store/common/widget/text/product_price_text.dart';
import 'package:t_store/common/widget/text/product_title_text.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';

import '../../../../../common/widget/circular_shape.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sell Price
        Row(
          children: [
            /// Sale teg
            Padding(
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
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: TColors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),

            /// Price
            Text(
              "\$150",
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            const ProductPriceText(price: '120',isLarge: true,)
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        /// Title
        const ProductTitleText(text: 'Green Nike Sports Shirt'),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// Stock Status
        Row(
          children: [
            const ProductTitleText(text: 'Status'),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text('In Stock',style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// Brand
        Row(
          children: [
            CircularImage(image: TImages.cosmeticsIcon,width: 32,height: 32,overlayColor: dark ? TColors.white : TColors.black,),
            const BrandTitleWithVerifyIcon(title: "Nike",brandTextSizes: TextSizes.medium,),
          ],
        )
      ],
    );
  }
}
