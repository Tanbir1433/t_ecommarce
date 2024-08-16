import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/feature/shop/controllers/product/image_controller.dart';
import '../../../../../common/widget/appbar/custom_appbar.dart';
import '../../../../../common/widget/curved_edges/curve_widget.dart';
import '../../../../../common/widget/icon/circular_icon.dart';
import '../../../../../common/widget/image/circular_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../model/product_model.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = Get.put(ImageController());
    final images = controller.getAllProductImage(product);

    return CurveWidget(
      child: Material(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Image
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargedImage(image),
                    child: CachedNetworkImage(
                      fit: BoxFit.contain,
                      imageUrl: image,
                      progressIndicatorBuilder: (_, __, downloadProgress) =>
                          CircularProgressIndicator(value: downloadProgress.progress, color: TColors.primary),
                    ),
                  );
                }),
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
                  itemCount: images.length,
                  itemBuilder: (_, index) => Obx(
                    () {
                      final imageSelected = controller.selectedProductImage.value == images[index];
                      return CircularImage(
                        image: images[index],
                        isNetworkImage: true,
                        width: 80,
                        height: 80,
                        borderRadius: 20,
                        fit: BoxFit.cover,
                        backgroundColor: dark ? TColors.dark : TColors.white,
                        border: BorderSide(color: imageSelected ? TColors.primary : Colors.transparent),
                        onTap: () => controller.selectedProductImage.value = images[index],
                      );
                    },
                  ),
                ),
              ),
            ),

            /// AppBar Icon
            const CustomAppbar(
              showBackArrow: true,
              actions: [
                CircularIcon(
                  icon: Iconsax.heart5,
                  iconColor: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
