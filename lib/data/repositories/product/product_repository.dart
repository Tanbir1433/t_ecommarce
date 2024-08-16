import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/feature/shop/model/product_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController{
  static ProductRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance;


  /// Get Featured Products
  Future<List<ProductModel>> getFeaturedProducts() async{
    try{
      final snapshot = await _db.collection("Products").where("IsFeatured",isEqualTo: true).limit(4).get();
      return snapshot.docs.map((documentSnapshot) => ProductModel.fromSnapshot(documentSnapshot)).toList();

    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something Went Wrong, Please try again';
    }
  }

  /// Get All Featured Products
  Future<List<ProductModel>> getAllFeaturedProducts() async{
    try{
      final snapshot = await _db.collection("Products").where("IsFeatured",isEqualTo: true).get();
      return snapshot.docs.map((documentSnapshot) => ProductModel.fromSnapshot(documentSnapshot)).toList();

    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something Went Wrong, Please try again';
    }
  }

  /// Get All Products
  Future<List<ProductModel>> getProductsByQuery(Query query) async{
    try{
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something Went Wrong, Please try again';
    }
  }


  /// Get All Products for Brand
  Future<List<ProductModel>> getProductsForBrand({required brandId, int limit = -1}) async{
    try{
      final querySnapshot = limit == -1 ? await _db.collection('Products').where('Brand.Id',isEqualTo: brandId).get() : await _db.collection('Products').where('Brand.Id',isEqualTo: brandId).limit(4).get();

      final product = querySnapshot.docs.map((doc)=> ProductModel.fromSnapshot(doc)).toList();

      return product;
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something Went Wrong, Please try again';
    }
  }




}

