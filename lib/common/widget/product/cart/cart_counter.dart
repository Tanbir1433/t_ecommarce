import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/feature/shop/screens/cart/cart_screen.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';

class CartCounter extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? iconColor;
  const CartCounter({
    super.key,
    this.onPressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: (){
            Get.to(() => const CartScreen());
          },
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 0,
          child: SizedBox(
            height: 18,
            width: 18,
            child: Material(
              color: dark ? TColors.white : TColors.black,
              borderRadius: BorderRadius.circular(18),
              child: Center(
                child: Text(
                  '2',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: dark ? TColors.black : TColors.white, fontSizeFactor: 0.8),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}