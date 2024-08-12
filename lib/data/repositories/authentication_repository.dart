import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/feature/authentication/screens/login/login_screen.dart';

import '../../feature/authentication/screens/onboarding/onboarding_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variable
  final deviceStorage = GetStorage();

  /// called from main.dart app
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    /// Local Storage

    if(kDebugMode){
      print("Get Storage");
      print(deviceStorage.read('IsFirstTime'));
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnboardingScreen());
  }

  /*-----------------------------Email & password authentication*---------------------------------------*/

  /// SignIn
  /// Register
  /// ReAuthentic User
  /// Mail Verification
  /// Forget Password
}
