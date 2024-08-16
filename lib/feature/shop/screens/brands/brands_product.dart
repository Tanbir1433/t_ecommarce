import 'package:flutter/material.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/common/widget/brands/brand_card.dart';
import 'package:t_store/common/widget/product/sortable/sortable_products.dart';
import 'package:t_store/feature/shop/controllers/brand_controller.dart';
import 'package:t_store/feature/shop/model/brand_model.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/shimmer/vertical_shimmer.dart';

class BrandsProduct extends StatelessWidget {
  const BrandsProduct({super.key, required this.brand});

  final BrandModel brand;


  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(brand.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              BrandCard(showBanner: true, brand: brand),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              FutureBuilder(
                future: controller.getBrandsProduct(brand.id),
                builder: (context, snapshot) {

                  /// Handel Loader
                  const loader = VerticalShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                  if(widget != null)return widget;

                  /// Record Found
                  final brandProduct = snapshot.data!;
                  return SortableProduct(products: brandProduct);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
