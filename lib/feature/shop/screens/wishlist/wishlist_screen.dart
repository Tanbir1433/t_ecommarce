import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/common/widget/layout/grid_layout.dart';
import 'package:t_store/common/widget/loaders/animation_loader.dart';
import 'package:t_store/common/widget/product/product_card_vertical.dart';
import 'package:t_store/feature/shop/controllers/product/favorite_controller.dart';
import 'package:t_store/feature/shop/screens/home/home_screen.dart';
import 'package:t_store/navigation_menu_bar.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/shimmer/vertical_shimmer.dart';

import '../../../../common/widget/icon/circular_icon.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoriteController.instance;
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          "WishList",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          CircularIcon(
            icon: Iconsax.add,
            onPressed: () {
              Get.to(() => const HomeScreen());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                future: controller.favoritesProduct(),
                builder: (context, snapshot) {


                  final emptyWidget = TAnimationLoaderWidget(
                    text: 'Whoops! Wishlist is Empty...',
                    animation: TImages.pencilAnimation,
                    showAction: true,
                    actionText: 'Let\'s add some',
                    onActionPressed: () => Get.off(() => const NavigationMenuBar()),
                  );

                  const loader = VerticalShimmer(itemCount: 6);
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                  if (widget != null) return widget;

                  final products = snapshot.data!;
                  return GridLayout(
                      itemCount: products.length,
                      itemBuilder: (_, index) =>
                          ProductCardVertical(product: products[index]));
                }),
          ),
        ),
      ),
    );
  }
}
