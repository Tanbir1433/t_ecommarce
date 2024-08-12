import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../../utils/popups/full_screen_loader.dart';

class SingUpController extends GetxController {
  static SingUpController get instance => Get.find();

  /// variable

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final fastName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> singUpFormKey = GlobalKey<FormState>();

  /// SingUP
  Future<void> singUp() async {
    try {
      /// Loading
      TFullScreenLoader.openLoadingDialog(
          "We Are Scanning Your Data....", TImages.animalIcon);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      /// Form Validation
      if (!singUpFormKey.currentState!.validate()) return;


      /// PRIVACY POLICY
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message: 'In Order to Create a Account, You must read privacy policy and accept it for uses',
        );
        return;
      }





    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
