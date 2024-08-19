import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/feature/shop/controllers/product/checkout_controller.dart';
import 'package:t_store/feature/shop/model/payment_method_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: (){
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: SizedBox(
        height: 40,
        width: 60,
        child: Material(
          color: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.white,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.sm),
            child: Image(
              fit: BoxFit.contain,
              image: AssetImage(
                paymentMethod.image
              ),
            ),
          ),
        ),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),

    );
  }
}
