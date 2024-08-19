import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/text/section_heading_text.dart';
import 'package:t_store/feature/shop/controllers/product/checkout_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class BillingPaymentMethod extends StatelessWidget {
  const BillingPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SectionHeadingText(title: 'Payment Method',
            buttonTitle: 'Change',
            onPressed: () => controller.selectPaymentMethod(context)),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Obx(() {
          return Row(
            children: [
              SizedBox(
                width: 60,
                height: 35,
                child: Material(
                  color: dark ? TColors.light : TColors.white,
                  borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
                  child: Padding(
                    padding: const EdgeInsets.all(TSizes.sm),
                    child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage(
                          controller.selectedPaymentMethod.value.image),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              Text(controller.selectedPaymentMethod.value.name, style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge,)
            ],
          );
        })
      ],
    );
  }
}
