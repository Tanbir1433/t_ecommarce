import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/brands/brand_card.dart';
import 'package:t_store/common/widget/layout/grid_layout.dart';
import 'package:t_store/common/widget/text/section_heading_text.dart';
import 'package:t_store/feature/shop/controllers/brand_controller.dart';
import 'package:t_store/feature/shop/screens/brands/brands_product.dart';

import '../../../../common/widget/appbar/custom_appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/shimmer/brand_shimmer.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: const CustomAppbar(
        showBackArrow: true,
        title: Text('Brands'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const SectionHeadingText(
                title: "Brands",
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// All Brands
              Obx(
                () {
                  if (controller.isLoading.value) return const BrandShimmer();

                  if (controller.allBrands.isEmpty) {
                    return Center(
                      child: Text(
                        "No Data Found",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: TColors.white),
                      ),
                    );
                  }

                  return GridLayout(
                    itemCount: controller.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = controller.allBrands[index];
                      return BrandCard(
                        showBanner: true,
                        brand: brand,
                        onTap: () => Get.to(() => BrandsProduct(brand: brand)),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
