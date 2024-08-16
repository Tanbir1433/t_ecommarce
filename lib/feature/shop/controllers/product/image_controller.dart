import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/feature/shop/model/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ImageController extends GetxController{
  static ImageController get instance => Get.find();

  RxString selectedProductImage = ''.obs;


  /// Get All Product Image
  List<String> getAllProductImage(ProductModel product){

    /// Set Unique image
    Set<String> images = {};

    /// Load Thumbnail Image
    images.add(product.thumbnail);

    /// Assigned Thumbnail image to selected image
    selectedProductImage.value = product.thumbnail;

    /// Get All the images from the product Model if not null
    if(product.images != null){
      images.addAll(product.images!);
    }

    /// Get All the images from the product Variation if not null
    if(product.productVariations != null || product.productVariations!.isNotEmpty){
      images.addAll(product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();

  }

  /// Show Image Popup
  void showEnlargedImage(String image){
    Get.to(
      fullscreenDialog: true,
        () => Dialog.fullscreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpace * 2,horizontal: TSizes.defaultSpace),
                child: CachedNetworkImage(imageUrl: image),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150,
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                    child: const Text("Close"),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }

}