import 'package:flutter/material.dart';
import 'package:t_store/common/widget/brands/brand_show_case.dart';
import 'package:t_store/feature/shop/controllers/brand_controller.dart';
import 'package:t_store/feature/shop/model/categorie_model.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/shimmer/boxes_shimmer.dart';
import 'package:t_store/utils/shimmer/list_title_shimmer.dart';

class CategoryBrand extends StatelessWidget {
  const CategoryBrand({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          const loader = Column(
            children: [
              ListTitleShimmer(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              BoxesShimmer(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            ],
          );

          final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          /// Record Found
          final brands = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                future: controller.getBrandsProduct(brandId: brand.id,limit: 3),
                builder: (context, snapshot) {

                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  /// Product Found
                  final products = snapshot.data!;
                  return BrandShowCase(images: products.map((e) => e.thumbnail).toList(), brand: brand,);
                }
              );
            },
          );
        });
  }
}
