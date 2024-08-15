import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/feature/shop/controllers/banner_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/shimmer/tshimmer_effect.dart';
import '../../../../../common/widget/circular_shape.dart';
import '../../../../../common/widget/image/banner_image.dart';
import '../../../../../utils/constants/sizes.dart';

class BannerSlider extends StatelessWidget {

  const BannerSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      /// Loader
      if(controller.isLoading.value) return const TShimmerEffect(width: double.infinity, height: 190);

      /// No data found
      if(controller.banners.isEmpty){
        return const Center(child: Text("No Data Found!"));
      }else{
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index),
              ),
              items: controller.banners.map((banner) => BannerImage(
                  imageUrl: banner.imageUrl,
                  isNetworkImage: true,
                  onPressed: () => Get.toNamed(banner.targetScreen)))
                  .toList(),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Obx(
                  () =>
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircularShape(
                            width: 20,
                            height: 4,
                            backgroundColor: controller.carousalCurrentIndex
                                .value == i
                                ? TColors.primary
                                : TColors.grey,
                          ),
                        ),
                    ],
                  ),
            )
          ],
        );
      }
    });
  }
}
