import 'package:flutter/material.dart';
import 'package:t_store/common/widget/image/circular_image.dart';
import 'package:t_store/common/widget/text/brand_title_verify_icon.dart';
import 'package:t_store/common/widget/text/product_price_text.dart';
import 'package:t_store/common/widget/text/product_title_text.dart';
import 'package:t_store/feature/shop/controllers/product/product_controller.dart';
import 'package:t_store/utils/constants/enums.dart';

import '../../../../../common/widget/circular_shape.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../model/product_model.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({
    super.key, required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
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
                    "$salePercentage%",
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
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
              Text(
                "\$${product.price}",
                style: Theme.of(context).textTheme.titleSmall!.apply(
                    decoration: TextDecoration.lineThrough
                ),
              ),

            if(product.productType == ProductType.single.toString() && product.salePrice > 0) const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            ProductPriceText(price: controller.getProductPrice(product),isLarge: true,)
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        /// Title
        ProductTitleText(text: product.title),
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
            Text(controller.getProductStockStatus(product.stock),style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// Brand
        Row(
          children: [
            CircularImage(image: product.brand != null ? product.brand!.image : '',width: 32,height: 32,overlayColor: dark ? TColors.white : TColors.black,),
            BrandTitleWithVerifyIcon(title: product.brand != null ? product.brand!.name : '',brandTextSizes: TextSizes.medium,),
          ],
        )
      ],
    );
  }
}
