import 'package:get/get.dart';
import 'package:t_store/data/repositories/banner/banner_repository.dart';
import 'package:t_store/feature/shop/model/banner_model.dart';

import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController{

  /// Variables

  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }


  Future<void> fetchBanners() async{
    try{

      /// Show Loader While Load Category
      isLoading.value = true;

      /// Fetch Banners From Data Source
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanner();

      /// Assigned Banners
      this.banners.assignAll(banners);

      /// Filter feature Category


    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }
}