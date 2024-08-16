import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/feature/shop/model/brand_model.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController{
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BrandModel>> getAllBrands() async{
    try{
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e)=>BrandModel.fromSnapshot(e)).toList();
      return result;

    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something Went Wrong, Please try again';
    }
  }


}