import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/text/product_price_text.dart';
import 'package:t_store/common/widget/text/product_title_text.dart';
import 'package:t_store/common/widget/text/section_heading_text.dart';
import 'package:t_store/feature/shop/controllers/product/variation_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widget/chip/selected_chip.dart';
import '../../../model/product_model.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = Get.put(VariationController());

    return Obx(() {
      return Column(
        children: [

          /// Selected Attribute Price & Description
          /// Display Variation Price when its Selected
          if(controller.selectedVariation.value.id.isNotEmpty)
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
                                if(controller.selectedVariation.value
                                    .salePrice > 0)
                                  Text(
                                    '\$${controller.selectedVariation.value
                                        .price}',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                        decoration: TextDecoration.lineThrough),
                                  ),

                                const SizedBox(
                                  width: TSizes.spaceBtwItems,
                                ),

                                /// Sale Price
                                ProductPriceText(
                                    price: controller.getVariationPrice()),
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
                                  controller.variationStockStatus.value,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleMedium,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    /// Variation Description
                    ProductTitleText(
                      text:
                      controller.selectedVariation.value.description ?? '',
                      smallSize: true,
                      maxLine: 4,
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!.map((attribute) =>
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeadingText(
                      title: attribute.name ?? '', showActionButton: false,),
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    Obx(() {
                      return Wrap(
                        spacing: 8,
                        children: attribute.values!.map((attributeValue) {
                          final isSelected = controller
                              .selectedAttributes[attribute.name] ==
                              attributeValue;

                          final available = controller
                              .getAttributeAvailabilityInVariation(
                              product.productVariations!, attribute.name!)
                              .contains(attributeValue);


                          return SelectedChip(text: attributeValue,
                              selected: isSelected,
                              onSelected: available ? (selected) {
                                if (selected && available) {
                                  controller.onAttributeSelected(
                                      product, attribute.name ?? '',
                                      attributeValue);
                                }
                              } : null);
                        },
                        ).toList(),
                      );
                    })
                  ],
                ),
            ).toList(),
          )
        ],
      );
    });
  }
}
