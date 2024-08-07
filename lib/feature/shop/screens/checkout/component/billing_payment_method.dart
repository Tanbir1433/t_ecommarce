import 'package:flutter/material.dart';
import 'package:t_store/common/widget/text/section_heading_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class BillingPaymentMethod extends StatelessWidget {
  const BillingPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SectionHeadingText(title: 'Payment Method',buttonTitle: 'Change',onPressed: (){},),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            SizedBox(
              width: 60,
              height: 35,
              child: Material(
                color: dark ? TColors.light : TColors.white,
                borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
                child: const Padding(
                  padding: EdgeInsets.all(TSizes.sm),
                  child: Image(
                    fit: BoxFit.contain,
                    image: AssetImage(TImages.paypal),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Text('Paypal',style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}
