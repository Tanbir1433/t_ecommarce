import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:t_store/feature/shop/controllers/product/cart_item_controller.dart';

import '../../../../../common/widget/product/cart/cart_add_remove_button.dart';
import '../../../../../common/widget/product/cart/cart_item.dart';
import '../../../../../common/widget/text/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class AllCartItems extends StatelessWidget {
  final bool showAddRemoveButton;

  const AllCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = CartItemController.instance;
    return Obx(() {
      return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) =>
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        itemCount: cartController.cartItems.length,
        itemBuilder: (_, index) =>
            Obx(() {
              final item = cartController.cartItems[index];
              return Column(
                children: [

                  /// Cart Item
                  CartItem(cartItem: item),
                  if(showAddRemoveButton) const SizedBox(
                    height: TSizes.spaceBtwItems,),

                  /// Add & Remove With Total Price
                  if(showAddRemoveButton) Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [

                          /// Extra Space
                          const SizedBox(width: 70,),

                          /// Add Remove Button
                          CartAddRemoveButton(quantity: item.quantity,add: () => cartController.addOneToCart(item),remove: () => cartController.removeOneFromCart(item)),

                        ],
                      ),
                      ProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1))
                    ],
                  )
                ],
              );
            }),
      );
    });
  }
}