import 'dart:convert';

import 'package:get/get.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/feature/shop/model/product_model.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';
import 'package:t_store/utils/popups/loaders.dart';

class FavoriteController extends GetxController{
  static FavoriteController get instance => Get.find();

  /// Variable
  final favorites = <String, bool>{}.obs;
  @override
  void onInit() {
    initFavorites();
    super.onInit();
  }

  Future<void> initFavorites() async{
    final json = TLocalStorage.instance().readData('favorites');
    if(json != null){
      final storedFavorites = jsonDecode(json) as Map<String,dynamic>;
      favorites.assignAll(storedFavorites.map((key,value)=>MapEntry(key, value as bool)));
    }
  }


  bool isFavorite(String productId){
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProducts(String productId){
    if(!favorites.containsKey(productId)){
      favorites[productId] = true;
      saveFavoritesToStorage();
      TLoaders.customToast(message: 'Product has been Added to the WishList');
    }else{
      TLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      TLoaders.customToast(message: 'Product has been Remove From the WishList');
    }
  }

  void saveFavoritesToStorage(){
    final encodedFavorites = json.encode(favorites);
    TLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoritesProduct()async{
    return await ProductRepository.instance.getFavoriteProducts(favorites.keys.toList());
  }
}