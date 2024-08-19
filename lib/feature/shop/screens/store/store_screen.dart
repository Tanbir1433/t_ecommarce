import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/common/widget/appbar/custom_tabbar.dart';
import 'package:t_store/common/widget/layout/grid_layout.dart';
import 'package:t_store/common/widget/text/section_heading_text.dart';
import 'package:t_store/feature/shop/controllers/brand_controller.dart';
import 'package:t_store/feature/shop/controllers/category_controller.dart';
import 'package:t_store/feature/shop/screens/brands/all_brand_screen.dart';
import 'package:t_store/feature/shop/screens/brands/brands_product.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/shimmer/brand_shimmer.dart';

import '../../../../common/widget/brands/brand_card.dart';
import '../../../../common/widget/product/cart/cart_counter.dart';
import '../../../../common/widget/search_field/search_filed.dart';
import '../../../../utils/constants/colors.dart';
import 'component/category_tab.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(

        /// App Bar
        appBar: CustomAppbar(
          title: Text(
            'Store',
            style: Theme
                .of(context)
                .textTheme
                .headlineMedium,
          ),
          actions: const [
            CartCounter()
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [

                      /// Search Bar
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      const SearchField(
                        text: 'Search in Store',
                        showBorder: true,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// Feature Brands
                      SectionHeadingText(
                        title: "Feature Brands",
                        showActionButton: true,
                        onPressed: () {
                          Get.to(() => const AllBrandScreen());
                        },
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),

                      /// Brands Grid
                      Obx(() {

                        if(brandController.isLoading.value) return const BrandShimmer();

                        if(brandController.featureBrands.isEmpty) {
                          return Center(child: Text("No Data Found",style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)));
                        }


                        return GridLayout(
                            itemCount: brandController.featureBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              final brand = brandController.featureBrands[index];

                              return BrandCard(showBanner: true, brand: brand,onTap: () => Get.to(() => BrandsProduct(brand: brand)));
                            });
                      })
                    ],
                  ),
                ),

                /// Tabs View
                bottom: CustomTabBar(
                  tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
                ),
              ),
            ];
          },
          body: TabBarView(children: categories.map((category) => CategoryTab(category: category)).toList(),
          ),
        ),
      ),
    );
  }
}
