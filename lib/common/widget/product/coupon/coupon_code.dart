import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? TColors.dark : TColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          side: const BorderSide(color: TColors.grey)),
      child: Padding(
        padding: const EdgeInsets.only(
            left: TSizes.md,
            top: TSizes.sm,
            bottom: TSizes.sm,
            right: TSizes.sm),
        child: Row(
          children: [
            /// Coupon Text Field
            Flexible(
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Enter Your Coupon Code',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),
              ),
            ),

            /// Button
            SizedBox(
              width: 80,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: dark ? TColors.white.withOpacity(0.5) : TColors.dark.withOpacity(0.5),
                    backgroundColor: TColors.grey.withOpacity(0.5),
                    side: BorderSide(
                        color: TColors.grey.withOpacity(0.1)
                    )
                ),
                child: const Text("Apply"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}