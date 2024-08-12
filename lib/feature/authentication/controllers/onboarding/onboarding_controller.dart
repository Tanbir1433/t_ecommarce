import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login_screen.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  ///Update Current Screen When Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the Specific dot Selected Page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update Current Index & Jump to the Next Page
  void nextPage() {
    if (currentPageIndex.value == 2) {

      final storage = GetStorage();

      storage.write('IsFirstTime', false);

      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  ///Update Current Index & Jump to the Last Page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
