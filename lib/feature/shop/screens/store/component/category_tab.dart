
import 'package:flutter/cupertino.dart';
import 'package:t_store/common/widget/layout/grid_layout.dart';
import 'package:t_store/common/widget/product/product_card_vertical.dart';
import 'package:t_store/common/widget/text/section_heading_text.dart';

import '../../../../../common/widget/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              const BrandShowCase(images: [
                TImages.productImage1,
                TImages.productImage2,
                TImages.productImage3,
              ],),
              const BrandShowCase(images: [
                TImages.productImage1,
                TImages.productImage2,
                TImages.productImage3,
              ],),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              /// Products
              SectionHeadingText(title: 'You Might Like',onPressed: (){},),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              GridLayout(itemCount: 4, itemBuilder: (_,index)=>const ProductCardVertical()),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


