import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/feature/shop/controllers/product/all_product_controller.dart';
import 'package:t_store/feature/shop/model/product_model.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../product_card_vertical.dart';

class SortableProduct extends StatelessWidget {
  const SortableProduct({
    super.key, required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignedProducts(products);
    return Column(
      children: [

        /// DropDown
        DropdownButtonFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort),
          ),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ].map((option) =>
              DropdownMenuItem(
                  value: option,
                  child: Text(option))).toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),

        /// All Products
        Obx(() {
          return GridLayout(itemCount: controller.products.length,
              itemBuilder: (_, index) =>
                  ProductCardVertical(product: controller.products[index],));
        })
      ],
    );
  }
}