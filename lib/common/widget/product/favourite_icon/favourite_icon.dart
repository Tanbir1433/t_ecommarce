import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/feature/shop/controllers/product/favorite_controller.dart';

import '../../icon/circular_icon.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    return Obx(() {
      return CircularIcon(
        icon: controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
        iconColor: controller.isFavorite(productId) ? Colors.red : null,
        onPressed: () => controller.toggleFavoriteProducts(productId),
      );
    });
  }
}
