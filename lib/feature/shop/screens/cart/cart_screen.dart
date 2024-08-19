import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/common/widget/loaders/animation_loader.dart';
import 'package:t_store/feature/shop/controllers/product/cart_item_controller.dart';
import 'package:t_store/feature/shop/screens/checkout/checkout_screen.dart';
import 'package:t_store/navigation_menu_bar.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import 'component/all_cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartItemController.instance;
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text('Cart', style: Theme
            .of(context)
            .textTheme
            .headlineSmall),
      ),

      body: Obx(() {
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops! cart is Empty',
          animation: TImages.cartAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const NavigationMenuBar()),
        );
        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: AllCartItems(),
            ),
          );
        }
      }),

      /// CheckOut Button
      bottomNavigationBar: controller.cartItems.isEmpty ? const SizedBox() : Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const CheckoutScreen());
          },
          child: Obx(() {
            return Text("CheckOut \$${controller.totalCartPrice.value}");
          }),
        ),
      ),
    );
  }
}




