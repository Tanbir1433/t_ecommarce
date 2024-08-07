
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../image/circular_image.dart';
import '../../text/brand_title_verify_icon.dart';
import '../../text/product_title_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// Image
        CircularImage(
          image: TImages.productImage1,
          width: 60,
          height: 60,
          padding: TSizes.sm,
          backgroundColor: dark ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),

        /// Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleWithVerifyIcon(title: 'Nike'),
              const Flexible(child: ProductTitleText(text: 'Black Sport Shoes',maxLine: 1,)),

              /// Attribute
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                            text: 'Color ',style: Theme.of(context).textTheme.bodySmall
                        ),
                        TextSpan(
                            text: 'Green ',style: Theme.of(context).textTheme.bodyLarge
                        ),
                        TextSpan(
                            text: 'Size ',style: Theme.of(context).textTheme.bodySmall
                        ),
                        TextSpan(
                            text: 'Uk 08 ',style: Theme.of(context).textTheme.bodyLarge
                        ),
                      ]
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}
