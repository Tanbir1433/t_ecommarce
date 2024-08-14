import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';

import '../../../feature/authentication/models/user_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;


  ///Save User Data T0 Firebase
  Future<void> saveUserRecord(UserModel user) async{
    try{
      return await _db.collection("Users").doc(user.id).set(user.toJson());
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

  /// Fetch User Details based on User id
  Future<UserModel> fetchUserDetails() async{
    try{
      final documentSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else{
        return UserModel.empty();
      }
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


  /// Update User Detail to Firebase
  Future<void> updateUserDetails(UserModel updateUser) async{
    try{
      return await _db.collection("Users").doc(updateUser.id).update(updateUser.toJson());
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


  /// Update any single or specific field data
  Future<void> updateSingleField(Map<String,dynamic> json) async{
    try{
      return await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
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

  /// Remove User data from firebase
  Future<void> removeUserRecord(String userId) async{
    try{
      await _db.collection("Users").doc(userId).delete();
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