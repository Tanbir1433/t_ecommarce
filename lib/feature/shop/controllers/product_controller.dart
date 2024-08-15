import 'package:get/get.dart';
import 'package:t_store/feature/shop/model/product_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../data/repositories/product/product_repository.dart';
import '../../../utils/constants/enums.dart';

class ProductController extends GetxController{
  static ProductController get instance => Get.find();


  final isLoading = false.obs;
  final RxList<ProductModel> featuredProducts = <ProductModel>[].obs;


  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  Future<void> fetchFeaturedProducts() async{
    try{

      /// Show Loader While Load Category
      isLoading.value = true;

      /// Fetch Feature Product Data Source
      final bannerRepo = Get.put(ProductRepository());
      final products = await bannerRepo.getFeaturedProducts();

      /// Assigned Banners
      featuredProducts.assignAll(products);

      /// Filter feature Category


    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  /// Get Featured Product



  /// Get Product Price
  String getProductPrice(ProductModel product){
    double smallPrice = double.infinity;
    double largestPrice = 0.0;

    if(product.productType == ProductType.single.toString()){
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    }else{
      for(var variation in product.productVariations!){
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        if(priceToConsider < smallPrice){
          smallPrice = priceToConsider;
        }
        if(priceToConsider > largestPrice){
          largestPrice = priceToConsider;
        }
      }
      if(smallPrice.isEqual(largestPrice)){
        return largestPrice.toString();
      }else{
        return '$smallPrice - \$$largestPrice';
      }
    }
  }

  /// Calculate Discount Price
  String? calculateSalePercentage(double originalPrice, double? salePrice){

    if(salePrice == null || salePrice <= 0.0) return null;
    if(originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }


  /// Product Stock Status
  String getProductStockStatus(int stock){
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}

