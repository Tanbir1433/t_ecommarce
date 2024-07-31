import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/feature/shop/controllers/home_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import '../../../../../common/widget/circular_shape.dart';
import '../../../../../common/widget/image/banner_image.dart';
import '../../../../../utils/constants/sizes.dart';

class BannerSlider extends StatelessWidget {
  final List<String> banners;
  const BannerSlider({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => BannerImage(imageUrl: url)).toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < banners.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircularShape(
                    width: 20,
                    height: 4,
                    backgroundColor: controller.carousalCurrentIndex.value == i
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
}
