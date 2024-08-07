import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/sucess_screen/sucess_screen.dart';
import 'package:t_store/feature/shop/screens/cart/component/all_cart_items.dart';
import 'package:t_store/feature/shop/screens/checkout/component/billing_address_method.dart';
import 'package:t_store/feature/shop/screens/checkout/component/billing_payment_method.dart';
import 'package:t_store/feature/shop/screens/checkout/component/billing_amount_method.dart';
import 'package:t_store/navigation_menu_bar.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widget/appbar/custom_appbar.dart';
import '../../../../common/widget/product/coupon/coupon_code.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
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
              const AllCartItems(
                showAddRemoveButton: false,
              ),
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
          onPressed: () {
            Get.to(
              () => SuccessScreen(
                image: TImages.successfulPaymentIcon,
                title: 'Payment Success!',
                subTitle: 'Your Item Will be Shipped Soon',
                onPressed: () => Get.offAll(() => const NavigationMenuBar()),
              ),
            );
          },
          child: const Text("CheckOut \$34.0"),
        ),
      ),
    );
  }
}
