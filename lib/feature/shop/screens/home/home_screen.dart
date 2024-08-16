import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/feature/shop/screens/all_product/all_product_screen.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/shimmer/vertical_shimmer.dart';
import '../../../../common/widget/home_header.dart';
import '../../../../common/widget/layout/grid_layout.dart';
import '../../../../common/widget/product/product_card_vertical.dart';
import '../../../../common/widget/search_field/search_filed.dart';
import '../../../../common/widget/text/section_heading_text.dart';
import '../../controllers/product/product_controller.dart';
import 'component/banner_slider.dart';
import 'component/home_appbar.dart';
import 'component/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
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
                    padding: EdgeInsets.symmetric(
                        horizontal: TSizes.spaceBtwSections),
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
                        HomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections,)
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [

                  /// Banner Slider
                  const BannerSlider(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Heading
                  SectionHeadingText(title: 'Popular Product',
                    onPressed: () => Get.to(() => const AllProductScreen()),),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  /// Popular Product
                  Obx(() {
                    if(controller.isLoading.value) return const VerticalShimmer();

                    if(controller.featuredProducts.isEmpty){
                      return Center(child: Text("No Data Found",style: Theme.of(context).textTheme.bodyMedium,));
                    }
                    return GridLayout(itemCount: controller.featuredProducts.length, itemBuilder: (_, index) => ProductCardVertical(product: controller.featuredProducts[index]));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
