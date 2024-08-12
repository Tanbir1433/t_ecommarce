import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/brands/brand_card.dart';
import 'package:t_store/common/widget/layout/grid_layout.dart';
import 'package:t_store/common/widget/text/section_heading_text.dart';
import 'package:t_store/feature/shop/screens/brands/brands_product.dart';

import '../../../../common/widget/appbar/custom_appbar.dart';
import '../../../../utils/constants/sizes.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              const SectionHeadingText(title: "Brands"),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// All Brands
              GridLayout(itemCount: 8,
                  mainAxisExtent: 80,
                  itemBuilder: (context,index) => BrandCard(showBanner: true,onTap: () => Get.to(() => const BrandsProduct()),))
            ],
          ),
        ),
      ),
    );
  }
}
