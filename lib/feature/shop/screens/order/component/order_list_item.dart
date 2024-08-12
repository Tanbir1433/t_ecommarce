import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwItems,
      ),
      itemCount: 10,
      itemBuilder: (_, index) => Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
            side: const BorderSide(color: Colors.grey)),
        color: dark ? TColors.dark : TColors.light,
        child: Padding(
          padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Row-1
              Row(
                children: [
                  /// Icon
                  const Icon(Iconsax.ship),
                  const SizedBox(
                    width: TSizes.spaceBtwItems / 2,
                  ),

                  /// Status & Date
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Processing',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: TColors.primary, fontWeightDelta: 1),
                        ),
                        Text(
                          '01 Nov 2023',
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                  ),

                  /// IconButton
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.arrow_right_34,
                        size: TSizes.iconSm,
                      ))
                ],
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Row-2
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        /// Icon
                        const Icon(Iconsax.tag),
                        const SizedBox(
                          width: TSizes.spaceBtwItems / 2,
                        ),

                        /// Status & Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Text(
                                '[#51761]',
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        /// Icon
                        const Icon(Iconsax.calendar),
                        const SizedBox(
                          width: TSizes.spaceBtwItems / 2,
                        ),

                        /// Status & Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shipping Date',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Text(
                                '01 Nov 2023',
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
