import 'package:get/get.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/feature/shop/model/brand_model.dart';
import 'package:t_store/feature/shop/model/product_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../data/repositories/brand/brand_repository.dart';

class BrandController extends GetxController{
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> featureBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeatureBrands();
    super.onInit();
  }

  /// Load Brand
  Future<void> getFeatureBrands() async{
    try{

      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);
      
      featureBrands.assignAll(allBrands.where((brand)=>brand.isFeatured ?? false).take(4));

    }catch(e){
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  /// Get Brands For Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async{
    try{
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;

    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return [];
    }
  }

  /// Get All Specific Brand Products
  Future<List<ProductModel>> getBrandsProduct({required String brandId,int limit = -1}) async{
    try{
      final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId,limit: limit);
      return products;
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return [];
    }
  }
}