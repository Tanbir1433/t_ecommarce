import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/feature/authentication/models/user_model.dart';
import 'package:t_store/feature/authentication/screens/login/login_screen.dart';
import 'package:t_store/feature/personalization/screens/profile/component/re_autthenticate_user_login_form.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../../utils/helpers/network_manager.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();


  @override
  onInit(){
    fetchUserRecorde();
    super.onInit();
  }

  /// Fetching User Recorde
  Future<void> fetchUserRecorde() async{
    try{
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    }catch(e){
      user(UserModel.empty());
    }finally{
      profileLoading.value = false;
    }
  }



  /// Save user of any registration
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      /// refresh user record
      await fetchUserRecorde();

      if(user.value.id.isEmpty){
        if (userCredential != null) {
          /// Convert name
          final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? '');
          final userName = UserModel.generateUserName(userCredential.user!.displayName ?? '');

          /// Map data
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            userName: userName,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data Not Save',
          message: 'Something went wrong when Saving your information, re-save your data from your profile',
      );
    }
  }


  /// Delete account warning
  void deleteAccountWarningPopUp(){
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: "Delete Account",
      middleText: 'Are you sure You want to delete your account permanently?',
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text("Delete"),
          ),
      ),
      cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text("Cancel"),
      )
    );
  }


  /// Delete User account
  void deleteUserAccount() async{
    try{

      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      /// first re-authentic user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        if(provider == "google.com"){
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        }else if(provider == 'password'){
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }

  /// Re-Authentic before Deleting Account
  Future<void> reAuthenticEmailAndPasswordUser() async{
    try{
      /// Loading
      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      if(!reAuthFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      TFullScreenLoader.stopLoading();

      Get.offAll(() => const LoginScreen());

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }


  /// Upload user Profile photo
  uploadUserProfilePicture() async{
    try{

      final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70,maxHeight: 512,maxWidth: 512);

      if(image != null){

        imageUploading.value = true;
        /// Upload Image
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        /// Update image
        Map<String,dynamic> json = {'ProfilePicture':imageUrl};

        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;

        user.refresh();
        TLoaders.successSnackBar(title: "Congratulation",message: 'Your Profile Image Has been Uploaded Successfully');

      }
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }finally{
      imageUploading.value = false;
    }
  }
}
