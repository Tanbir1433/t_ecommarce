import 'package:get/get.dart';
import 'package:t_store/feature/personalization/controllers/address_controller.dart';
import 'package:t_store/feature/shop/controllers/product/checkout_controller.dart';
import 'package:t_store/feature/shop/controllers/product/variation_controller.dart';
import 'package:t_store/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings{
  
  @override
  void dependencies(){
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }
}