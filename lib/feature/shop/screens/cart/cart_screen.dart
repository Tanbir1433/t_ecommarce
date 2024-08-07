import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/feature/shop/screens/checkout/checkout_screen.dart';
import 'package:t_store/utils/constants/sizes.dart';

import 'component/all_cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),

      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: AllCartItems(),
      ),

      /// CheckOut Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: (){
            Get.to(() => const CheckoutScreen());
          },
          child: const Text("CheckOut \$254.0"),
        ),
      ),
    );
  }
}




