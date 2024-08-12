import 'package:flutter/material.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/common/widget/brands/brand_card.dart';
import 'package:t_store/common/widget/product/sortable/sortable_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BrandsProduct extends StatelessWidget {
  const BrandsProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text("Nike"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              BrandCard(showBanner: true),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              SortableProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
