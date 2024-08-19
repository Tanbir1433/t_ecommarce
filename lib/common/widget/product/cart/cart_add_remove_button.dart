import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icon/circular_icon.dart';

class CartAddRemoveButton extends StatelessWidget {
  const CartAddRemoveButton({
    super.key, required this.quantity, this.add, this.remove,

  });

  final int quantity;
  final VoidCallback? add,remove;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(icon: Iconsax.minus,size: TSizes.md,iconColor: dark ? TColors.white: TColors.black,border: const BorderSide(color: TColors.primary),onPressed: remove,),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Text(quantity.toString(),style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: TSizes.spaceBtwItems,),
        CircularIcon(icon: Iconsax.add,size: TSizes.md,iconColor: dark ? TColors.white: TColors.black,border: const BorderSide(color: TColors.primary),onPressed: add,),
      ],
    );
  }
}