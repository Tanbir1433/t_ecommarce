import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/feature/shop/controllers/product/cart_item_controller.dart';
import 'package:t_store/feature/shop/controllers/product/order_controller.dart';
import 'package:t_store/feature/shop/screens/cart/component/all_cart_items.dart';
import 'package:t_store/feature/shop/screens/checkout/component/billing_address_method.dart';
import 'package:t_store/feature/shop/screens/checkout/component/billing_payment_method.dart';
import 'package:t_store/feature/shop/screens/checkout/component/billing_amount_method.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/helpers/pricing_calculator.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../../common/widget/appbar/custom_appbar.dart';
import '../../../../common/widget/product/coupon/coupon_code.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final cartController = CartItemController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'US');
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Items in Cart
              const AllCartItems(showAddRemoveButton: false,),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Coupon Field
              const CouponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Billing Section
              Material(
                color: dark ? TColors.black : TColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                  side: const BorderSide(color: TColors.grey),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(TSizes.md),
                  child: Column(
                    children: [
                      /// Pricing
                      BillingAmountMethod(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// Divider
                      Divider(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// Payment Method
                      BillingPaymentMethod(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// Address
                      BillingAddressMethod(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: subTotal > 0
              ? () => orderController.processOrder(totalAmount)
              : () => TLoaders.warningSnackBar(title: "Empty card",message: 'Add Items in the Cart in order to proceed'),
          child: Text("CheckOut \$$totalAmount"),
        ),
      ),
    );
  }
}
