import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/text/section_heading_text.dart';
import 'package:t_store/feature/shop/screens/product_review/product_review_screen.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';
import '../../model/product_model.dart';
import 'component/bottom_add_to_cart.dart';
import 'component/product_attribute.dart';
import 'component/product_image_slider.dart';
import 'component/product_meta_data.dart';
import 'component/rating_and_share.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            ProductImageSlider(product: product),

            /// Product Details
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: TSizes.defaultSpace,right: TSizes.defaultSpace,bottom: TSizes.defaultSpace,),
                child: Column(
                  children: [
                    /// Rating & Share
                    const RatingAndShare(),

                    /// price, Title, Stock, & Brand
                    ProductMetaData(product: product,),

                    /// Attributes
                    if(product.productType == ProductType.variable.toString()) ProductAttributes(product: product),
                    if(product.productType == ProductType.variable.toString()) const SizedBox(height: TSizes.spaceBtwItems),

                    /// Check Out Button
                    SizedBox(
                      width: double.infinity,
                        child: ElevatedButton(onPressed: (){}, child: const Text('CheckOut'))),

                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    /// Description
                    const SectionHeadingText(title: 'Description',showActionButton: false,),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    ReadMoreText(
                      product.description ?? '',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: "SHow More",
                      trimExpandedText: 'Show Less',
                      moreStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                      lessStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                    ),




                    /// Review
                    const Divider(),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    SectionHeadingText(title: 'Review(199)',onPressed: (){
                      Get.to(() => const ProductReviewScreen());
                    },),

                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomAddToCart(),
    );
  }
}
