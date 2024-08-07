import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icon/circular_icon.dart';

class CartAddRemoveButton extends StatelessWidget {
  const CartAddRemoveButton({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(icon: Iconsax.minus,size: TSizes.md,iconColor: dark ? TColors.white: TColors.black,backgroundColor: dark ? TColors.darkerGrey: TColors.light,),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Text('2',style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: TSizes.spaceBtwItems,),
        const CircularIcon(icon: Iconsax.add,size: TSizes.md,iconColor: TColors.white,backgroundColor: TColors.primary,),
      ],
    );
  }
}