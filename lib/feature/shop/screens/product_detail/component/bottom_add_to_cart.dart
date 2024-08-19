import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/icon/circular_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      child: Material(
        elevation: 0.0,
        color: dark ? TColors.black : TColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black.withOpacity(0.9) : TColors.white.withOpacity(0.9),
                  iconColor: TColors.black,
                  border: const BorderSide(color: TColors.black),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  '3',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                const CircularIcon(
                  icon: Iconsax.add,
                  iconColor: TColors.black,
                  border: BorderSide(color: TColors.black),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(TSizes.md),
                  backgroundColor: TColors.darkGrey,
                  side: const BorderSide(color: TColors.black)
                ),
                child: const Row(
                  children: [
                    Icon(Iconsax.shopping_bag),
                    SizedBox(width: TSizes.spaceBtwItems/2,),
                    Text('Add To Cart'),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
