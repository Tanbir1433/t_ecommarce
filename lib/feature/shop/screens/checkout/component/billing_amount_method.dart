import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BillingAmountMethod extends StatelessWidget {
  const BillingAmountMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Sub Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SubTotal',style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$34.0',style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),

        /// Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee',style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$4.0',style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),

        /// Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee',style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$4.0',style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total',style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$4.0',style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
      ],
    );
  }
}
