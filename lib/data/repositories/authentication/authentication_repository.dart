
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
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

  /// Get Current user
  User? get authUser => _auth.currentUser;

  /// called from main.dart app
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user= _auth.currentUser;


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

  /// SignIn / Login
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
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


  /// Forget Password
  Future<void> sendPasswordResetEmail(String email) async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
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


  /// Re-Authenticate User
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async{
    try{

      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      await _auth.currentUser!.reauthenticateWithCredential(credential);

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



/*-------------Login with Google or Facebook--------------*/
  /// Google
  Future<UserCredential?> signInWithGoogle() async{
    try{
      /// Trigger the Authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken,);

      return await _auth.signInWithCredential(credentials);



    }on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      if(kDebugMode) print('Something Went wrong: $e');
      return null;
    }
  }


  /// Facebook

/*-------------LogOut or Delete User--------------*/

 /// Logout
 Future<void> logout() async{
   try{
     await GoogleSignIn().signOut();
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
 Future<void> deleteAccount() async{
   try{
     await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
     await _auth.currentUser?.delete();
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

}


