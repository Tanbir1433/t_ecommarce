import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import '../../../../common/widget/home_header.dart';
import '../../../../common/widget/layout/grid_layout.dart';
import '../../../../common/widget/product/product_card_vertical.dart';
import '../../../../common/widget/search_field/search_filed.dart';
import '../../../../common/widget/text/section_heading_text.dart';
import '../../../../utils/constants/image_strings.dart';
import 'component/banner_slider.dart';
import 'component/home_appbar.dart';
import 'component/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const PrimaryHeader(
              child: Column(
                children: [
                  /// Home AppBar
                  HomeAppBar(),

                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Search Bar
                  SearchField(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Categories List
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        SectionHeadingText(
                          title: 'Popular categories',
                          showActionButton: false,
                          textColor: TColors.white,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        /// Categories
                        HomeCategories()
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Banner Slider
                  const BannerSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Heading
                  SectionHeadingText(title: 'Popular Product',onPressed: (){},),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  /// Popular Product
                  GridLayout(
                    itemCount: 4,
                    itemBuilder: (_ , index ) => const ProductCardVertical(),),




                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
