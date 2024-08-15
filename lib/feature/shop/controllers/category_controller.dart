import 'package:get/get.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/feature/shop/model/categorie_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();


  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }


  /// Load Categories data
  Future<void> fetchCategory() async{
    try{

      /// Show Loader While Load Category
      isLoading.value = true;

      /// Fetch Category From Data Source
      final categories = await _categoryRepository.getAllCategories();


      /// Update The Category List
      allCategories.assignAll(categories);

      /// Filter feature Category

      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  /// Load Selected categories data

  /// Get Category or sub_category Products

}