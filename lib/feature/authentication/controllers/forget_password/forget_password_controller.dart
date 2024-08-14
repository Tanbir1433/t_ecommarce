import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/feature/authentication/screens/password_configuration/reset_password_screen.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  /// Variable
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send reset Password Email
  sendPasswordResetEmail()async{
    try{
      /// Start Loading
      TFullScreenLoader.openLoadingDialog('Processing Your Request...', TImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());


      /// Remove Loader
      TFullScreenLoader.stopLoading();

      /// Success PopUp
      TLoaders.successSnackBar(title: 'Email Sent',message: 'Reset your password'.tr);

      /// Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim(),));

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }



  resendPasswordResetEmail(String email) async{
    try{
      /// Start Loading
      TFullScreenLoader.openLoadingDialog('Processing Your Request...', TImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }


      await AuthenticationRepository.instance.sendPasswordResetEmail(email);


      /// Remove Loader
      TFullScreenLoader.stopLoading();

      /// Success PopUp
      TLoaders.successSnackBar(title: 'Email Sent',message: 'Reset your password'.tr);


    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }
}