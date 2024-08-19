import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';

import '../../../feature/personalization/model/address_model.dart';

class AddressRepository extends GetxController{
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddresses() async{
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) throw 'Unable to Find User Information, Try Again';

      final result = await _db.collection('Users').doc(userId).collection('Addresses').get();
      return result.docs.map((documentSnapshot)=>AddressModel.formDocumentSnapshot(documentSnapshot)).toList();
    }catch(e){
      throw'Something Went Wrong Please try Again!';
    }
  }

  Future<void> updateSelectedField(String addressId, bool selected) async{
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await _db.collection('Users').doc(userId).collection('Addresses').doc(addressId).update({'SelectedAddress':selected});

    }catch(e){
      throw 'Unable to Update your selection Address, Try Again Later';
    }
  }

  Future<String> addAddress(AddressModel address) async{
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final currentAddress = await _db.collection('Users').doc(userId).collection('Addresses').add(address.toJson());
      return currentAddress.id;
    }catch(e){
      throw'Something Went Wrong Please try Again!';
    }
  }

}