
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/layout/grid_layout.dart';
import 'package:t_store/common/widget/product/product_card_vertical.dart';
import 'package:t_store/common/widget/text/section_heading_text.dart';
import 'package:t_store/feature/shop/controllers/category_controller.dart';
import 'package:t_store/feature/shop/model/categorie_model.dart';
import 'package:t_store/feature/shop/screens/all_product/all_product_screen.dart';
import 'package:t_store/feature/shop/screens/store/component/category_brand.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/shimmer/vertical_shimmer.dart';

import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key, required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              CategoryBrand(category: category),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              /// Products
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {


                  final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: const VerticalShimmer());

                  if(response != null)return response;

                  /// Get Product
                  final products = snapshot.data!;

                  return Column(
                    children: [
                      SectionHeadingText(title: 'You Might Like',onPressed: () => Get.to(() => AllProductScreen(title: category.name,futureMethod: controller.getCategoryProducts(categoryId: category.id,limit: -1)))),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      GridLayout(itemCount: products.length, itemBuilder: (_,index)=>ProductCardVertical(product: products[index])),
                    ],
                  );
                }
              ),
            ],
          ),
        ),
      ],
    );
  }
}


