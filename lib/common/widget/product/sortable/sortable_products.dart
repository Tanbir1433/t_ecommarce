import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/feature/shop/model/product_model.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../product_card_vertical.dart';

class SortableProduct extends StatelessWidget {
  const SortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// DropDown
        DropdownButtonFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort)
          ),
          onChanged: (value) {  },
          items: [
            'Name','Higher Price','Lower Price','Sale','Newest','Popularity'
          ].map((option) => DropdownMenuItem(
              value: option,
              child: Text(option))).toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),

        /// All Products
        GridLayout(itemCount: 10, itemBuilder: (_,index) => ProductCardVertical(product: ProductModel.empty(),))
      ],
    );
  }
}