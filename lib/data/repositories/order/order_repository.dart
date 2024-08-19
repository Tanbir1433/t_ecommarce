import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/feature/shop/model/order_model.dart';

class OrderRepository extends GetxController{
  static OrderRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;


  Future<List<OrderModel>> fetchUserOrders() async{
    try{

      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty)throw 'Unable to find user information, Please try again';
      final result = await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs.map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot)).toList();

    }catch(e){
      throw 'Something Went Wrong while fetch user order';
    }
  }

  Future<void> saveOrder(OrderModel order,String userId) async{
    try{
      await _db.collection('Users').doc(userId).collection('Orders').add(order.toJson());
    }catch(e){
      throw 'Something went wrong while save your Order Information';
    }
  }

}