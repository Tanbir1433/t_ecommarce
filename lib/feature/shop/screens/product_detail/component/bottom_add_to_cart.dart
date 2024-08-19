import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/icon/circular_icon.dart';
import 'package:t_store/feature/shop/controllers/product/cart_item_controller.dart';
import 'package:t_store/feature/shop/model/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = CartItemController.instance;
    controller.updatedAlreadyAddedProductCount(product);

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      child: Material(
        elevation: 0.0,
        color: dark ? TColors.black : TColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircularIcon(
                    icon: Iconsax.minus,
                    iconColor: TColors.black,
                    border: const BorderSide(color: TColors.black),
                    onPressed: () =>
                    controller.productQuantityInCart.value < 1
                        ? null
                        : controller.productQuantityInCart.value -= 1,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Text(
                    controller.productQuantityInCart.value.toString(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  CircularIcon(
                    icon: Iconsax.add,
                    iconColor: TColors.black,
                    border: const BorderSide(color: TColors.black),
                    onPressed: () =>
                    controller.productQuantityInCart.value += 1,
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: controller.productQuantityInCart.value < 1
                      ? null
                      : () => controller.addToCart(product),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(TSizes.md),
                      backgroundColor: TColors.darkGrey,
                      side: const BorderSide(color: TColors.black)
                  ),
                  child: const Row(
                    children: [
                      Icon(Iconsax.shopping_bag),
                      SizedBox(width: TSizes.spaceBtwItems / 2,),
                      Text('Add To Cart'),
                    ],
                  ))
            ],
          );
        }),
      ),
    );
  }
}
