import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/common/widget/layout/grid_layout.dart';
import 'package:t_store/common/widget/product/product_card_vertical.dart';
import 'package:t_store/feature/shop/screens/home/home_screen.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widget/icon/circular_icon.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          "WishList",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          CircularIcon(
            icon: Iconsax.add,
            onPressed: (){
              Get.to(() => const HomeScreen());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              GridLayout(itemCount: 10, itemBuilder: (_,index) => const ProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
