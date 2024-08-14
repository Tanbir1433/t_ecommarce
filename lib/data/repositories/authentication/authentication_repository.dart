
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/feature/authentication/screens/login/login_screen.dart';
import 'package:t_store/feature/authentication/screens/singup/verify_screen/verify_email_screen.dart';
import 'package:t_store/navigation_menu_bar.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

import '../../../feature/authentication/screens/onboarding/onboarding_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// called from main.dart app
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    User? user= _auth.currentUser;
    if(user != null){
      if(user.emailVerified){
        Get.offAll(() => const NavigationMenuBar());
      }else{
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }else{
      /// Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);

      /// if user is for the first time
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnboardingScreen());
    }
  }

  /*-----------------------------Email & password authentication*---------------------------------------*/

  /// SignIn

  /// Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something Went Wrong, Please try again';
    }
  }

  /// [EmailAuthentication] - Mail Verification
  Future<void> sendEmailVerification() async{
    try{
      return await _auth.currentUser?.sendEmailVerification();
    }on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something Went Wrong, Please try again';
    }
  }

  /// ReAuthentic User
  /// Mail Verification
  /// Forget Password

/*-------------Login with Google or Facebook--------------*/
  /// Google
  /// Facebook

/*-------------LogOut or Delete User--------------*/

 /// Logout
 Future<void> logout() async{
   try{
     await FirebaseAuth.instance.signOut();
     Get.offAll(() => const LoginScreen());
   }on FirebaseAuthException catch (e){
     throw TFirebaseAuthException(e.code).message;
   }on FirebaseException catch (e){
     throw TFirebaseException(e.code).message;
   }on FormatException catch (_){
     throw const TFormatException();
   }on PlatformException catch(e){
     throw TPlatformException(e.code).message;
   }catch(e){
     throw 'Something Went Wrong, Please try again';
   }
 }


 /// Delete User
}


