import 'package:flutter/material.dart';
import 'package:t_store/common/widget/text/product_price_text.dart';
import 'package:t_store/common/widget/text/product_title_text.dart';
import 'package:t_store/common/widget/text/section_heading_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widget/chip/selected_chip.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Material(
          color: dark ? TColors.darkerGrey : TColors.grey,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                /// Title, Price And Stock Status
                Row(
                  children: [
                    const SectionHeadingText(
                      title: "Variation",
                      showActionButton: false,
                    ),
                    const SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const ProductTitleText(
                              text: 'Price: ',
                              smallSize: true,
                            ),

                            /// Actual Price
                            Text(
                              '\$25',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough),
                            ),

                            const SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),

                            /// Sale Price
                            const ProductPriceText(price: '20')
                          ],
                        ),

                        /// Stock
                        Row(
                          children: [
                            const ProductTitleText(
                              text: "Stock: ",
                              smallSize: true,
                            ),
                            Text(
                              'In Stock',
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                /// Variation Description
                const ProductTitleText(
                  text:
                      "This is About The product Description and its max to max go for 4 line",
                  smallSize: true,
                  maxLine: 4,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeadingText(title: 'Color',showActionButton: false,),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                SelectedChip(text: 'Green', selected: false,onSelected: (value){},),
                SelectedChip(text: 'Blue', selected: true,onSelected: (value){}),
                SelectedChip(text: 'Yellow', selected: false,onSelected: (value){}),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeadingText(title: 'Size',showActionButton: false,),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                SelectedChip(text: 'EU 34', selected: true,onSelected: (value){}),
                SelectedChip(text: 'EU 36', selected: false,onSelected: (value){}),
                SelectedChip(text: 'EU 38', selected: false,onSelected: (value){}),

              ],
            )
          ],
        )
      ],
    );
  }
}
