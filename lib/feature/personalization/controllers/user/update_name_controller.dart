import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/feature/personalization/controllers/user/user_controller.dart';
import 'package:t_store/feature/personalization/screens/profile/profile_screen.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();

  /// Variable
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameKey = GlobalKey<FormState>();

  @override
  void onInit(){
    initializeName();
    super.onInit();
  }


  /// Fetch User Record
  Future<void> initializeName() async{
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  /// Update User Name
  Future<void> updateUserName() async{
    try{
      /// Start Loading
      TFullScreenLoader.openLoadingDialog('Processing Your Request...', TImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form validation
      if(!updateUserNameKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }


      /// update first & lastName to firebase
      Map<String,dynamic> name = {'FirstName':firstName.text.trim(),'LastName':lastName.text.trim()};
      await userRepository.updateSingleField(name);

      /// update the rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      /// Remove loader
      TFullScreenLoader.stopLoading();

      /// show success message
      TLoaders.successSnackBar(title: 'Congratulations!',message: 'Your Name has been Updated Successfully');
      
      /// Redirect
      Get.off(() => const ProfileScreen());

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }
}