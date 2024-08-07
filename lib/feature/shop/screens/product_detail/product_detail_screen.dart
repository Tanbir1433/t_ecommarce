import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/text/section_heading_text.dart';
import 'package:t_store/feature/shop/screens/product_review/product_review_screen.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';
import 'component/bottom_add_to_cart.dart';
import 'component/product_attribute.dart';
import 'component/product_image_slider.dart';
import 'component/product_meta_data.dart';
import 'component/rating_and_share.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            const ProductImageSlider(),

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
                    const ProductMetaData(),

                    /// Attributes
                    const ProductAttributes(),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

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
                    const ReadMoreText(
                      'A product description is a form of marketing copy used to describe and explain the benefits of your product. In other words, it provides all the information and details of your product on your ecommerce site. These product details can be one sentence, a short paragraph or bulleted. They can be serious, funny or quirky.',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: "SHow More",
                      trimExpandedText: 'Show Less',
                      moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                      lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
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
