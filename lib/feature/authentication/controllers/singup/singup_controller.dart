import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/feature/authentication/models/user_model.dart';
import 'package:t_store/feature/authentication/screens/singup/verify_screen/verify_email_screen.dart';
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
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> singUpFormKey = GlobalKey<FormState>();

  /// SingUP
  void singUp() async {
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
          message:
              'In Order to Create a Account, You must read privacy policy and accept it for uses',
        );
        return;
      }

      /// Register User in Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      /// Save user data
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TLoaders.successSnackBar(title: 'Congratulation',message: 'Your Account has been Created successfully');
      
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
