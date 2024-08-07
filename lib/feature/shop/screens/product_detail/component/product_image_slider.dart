import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widget/appbar/custom_appbar.dart';
import '../../../../../common/widget/curved_edges/curve_widget.dart';
import '../../../../../common/widget/icon/circular_icon.dart';
import '../../../../../common/widget/image/circular_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return CurveWidget(
      child: Material(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Image
            const SizedBox(
              height: 400,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Image(image: AssetImage(TImages.productImage1)),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  itemCount: 4,
                  itemBuilder: (_, index) => CircularImage(
                    image: TImages.productImage3,
                    width: 80,
                    fit: BoxFit.contain,
                    backgroundColor: dark ? TColors.dark : TColors.white,
                    border: const BorderSide(
                      color: TColors.primary,
                    ),
                  ),
                ),
              ),
            ),

            /// AppBar Icon
            const CustomAppbar(
              showBackArrow: true,
              actions: [
                CircularIcon(icon: Iconsax.heart5,iconColor: Colors.red,)
              ],
            )
          ],
        ),
      ),
    );
  }
}