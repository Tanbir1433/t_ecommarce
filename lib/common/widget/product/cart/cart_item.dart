import 'package:flutter/material.dart';
import 'package:t_store/feature/shop/model/cart_item_model.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../image/circular_image.dart';
import '../../text/brand_title_verify_icon.dart';
import '../../text/product_title_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItem,
  });
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// Image
        CircularImage(
          image: cartItem.image ?? '',
          width: 60,
          height: 60,
          padding: TSizes.sm,
          backgroundColor: dark ? TColors.darkerGrey : TColors.light,
          isNetworkImage: true,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        /// Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleWithVerifyIcon(title: cartItem.brandName ?? ''),
              Flexible(
                  child: ProductTitleText(
                text: cartItem.title,
                maxLine: 1,
              )),

              /// Attribute
              Text.rich(TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map((e) => TextSpan(children: [
                            TextSpan(text: e.key, style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(text: e.value, style: Theme.of(context).textTheme.bodyLarge),
                          ]))
                      .toList()))
            ],
          ),
        )
      ],
    );
  }
}
