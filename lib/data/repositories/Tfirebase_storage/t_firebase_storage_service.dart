// import 'dart:io';
//
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// class TFirebaseStorageService extends GetxController{
//   static TFirebaseStorageService get instance => Get.find();
//
//   final _firebaseStorage = FirebaseStorage.instance;
//
//
//   Future<Unit8List> getImageDataFormAssets(String path) async{
//     try{
//       final byteData = await rootBundle.load(path);
//       final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes,byteData.lengthInBytes);
//       return imageData;
//     }catch(e){
//       throw 'Error Loading Image Data: $e';
//     }
//   }
//
//
//   Future<String> uploadImageData(String path, Unit8List image, String name) async{
//     try{
//       final ref = _firebaseStorage.ref(path).child(name);
//       await ref.putData(image);
//       final url = await ref.getDownloadURL();
//       return url;
//     }catch(e){
//
//       if(e is FirebaseException) {
//         throw 'Firebase Exception: ${e.message}';
//       }else if(e is SocketException){
//         throw 'Network Error: ${e.message}';
//       }else if(e is PlatformException){
//         throw 'Platform Exception: ${e.message}';
//       }else{
//         throw 'Something Went wrong';
//       }
//     }
//   }
//
//
//   Future<String> uploadImageFile(String path, XFile image) async{
//     try{
//       final ref = _firebaseStorage.ref(path).child(image.name);
//       await ref.putFile(File(image.path));
//       final url = await ref.getDownloadURL();
//       return url;
//     }catch(e){
//       if(e is FirebaseException) {
//         throw 'Firebase Exception: ${e.message}';
//       }else if(e is SocketException){
//         throw 'Network Error: ${e.message}';
//       }else if(e is PlatformException){
//         throw 'Platform Exception: ${e.message}';
//       }else{
//         throw 'Something Went wrong';
//       }
//     }
//   }
// }
