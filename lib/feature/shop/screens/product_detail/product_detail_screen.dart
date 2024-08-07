import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/common/widget/curved_edges/curve_widget.dart';
import 'package:t_store/common/widget/icon/circular_icon.dart';
import 'package:t_store/common/widget/image/circular_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import 'component/product_attribute.dart';
import 'component/product_image_slider.dart';
import 'component/product_meta_data.dart';
import 'component/rating_and_share.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            ProductImageSlider(),

            /// Product Details
            Padding(
              padding: EdgeInsets.only(left: TSizes.defaultSpace,right: TSizes.defaultSpace,bottom: TSizes.defaultSpace,),
              child: Column(
                children: [
                  /// Rating & Share
                  RatingAndShare(),

                  /// price, Title, Stock, & Brand
                  ProductMetaData(),

                  /// Attributes
                  ProductAttributes(),

                  /// Check Out Button
                  /// Description
                  /// Review
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
