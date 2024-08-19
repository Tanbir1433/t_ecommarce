import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/feature/shop/controllers/product/cart_item_controller.dart';
import 'package:t_store/feature/shop/screens/product_detail/product_detail_screen.dart';
import 'package:t_store/utils/constants/enums.dart';

import '../../../../feature/shop/model/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class ProductCartAdToCartButton extends StatelessWidget {
  const ProductCartAdToCartButton({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartItemController.instance;
    return InkWell(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart = cartController.getProductQuantityInCart(product.id);

        return  Material(
          color: productQuantityInCart > 0 ?TColors.primary:TColors.dark,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(TSizes.cardRadiusMd),
              bottomRight: Radius.circular(TSizes.productImageRadius)),
          child: SizedBox(
              height: TSizes.iconLg * 1.2,
              width: TSizes.iconLg * 1.2,
              child: Center(
                child: productQuantityInCart > 0 ? Text(productQuantityInCart.toString(),style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.white)): const Icon(
                  Iconsax.add,
                  color: TColors.white,
                ),
              )),
        );
      }),
    );
  }
}
