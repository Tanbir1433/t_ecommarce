import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/common/widget/image/circular_image.dart';
import 'package:t_store/common/widget/product/product_card_horizontal.dart';
import 'package:t_store/common/widget/text/section_heading_text.dart';
import 'package:t_store/feature/shop/controllers/category_controller.dart';
import 'package:t_store/feature/shop/model/categorie_model.dart';
import 'package:t_store/feature/shop/screens/all_product/all_product_screen.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/shimmer/horizontal_shimmer.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(category.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const CircularImage(
                image: TImages.promoBanner1,
                width: double.infinity,
                height: 250,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Sub-Categories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {
                  const loader = HorizontalShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  final subCategories = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final subCategory = subCategories[index];

                      return FutureBuilder(
                        future: controller.getCategoryProducts(categoryId: subCategory.id),
                        builder: (context, snapshot) {

                          final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                          if (widget != null) return widget;

                          final products = snapshot.data!;

                          return Column(
                            children: [
                              /// Heading
                              SectionHeadingText(
                                title: subCategory.name,
                                onPressed: () => Get.to(() => AllProductScreen(title: subCategory.name,futureMethod: controller.getCategoryProducts(categoryId: subCategory.id,limit: -1))),
                              ),
                              const SizedBox(
                                height: TSizes.spaceBtwItems / 2,
                              ),

                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  itemCount: products.length,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    width: TSizes.spaceBtwItems,
                                  ),
                                  itemBuilder: (_, index) => ProductCardHorizontal(product: products[index]),
                                ),
                              ),
                              const SizedBox(height: TSizes.spaceBtwSections,),
                            ],
                          );
                        }
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
