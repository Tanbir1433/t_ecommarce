import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/common/screen/success_screen.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/order/order_repository.dart';
import 'package:t_store/feature/personalization/controllers/address_controller.dart';
import 'package:t_store/feature/shop/controllers/product/cart_item_controller.dart';
import 'package:t_store/feature/shop/controllers/product/checkout_controller.dart';
import 'package:t_store/feature/shop/model/order_model.dart';
import 'package:t_store/navigation_menu_bar.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// variable
  final cartController = CartItemController.instance;
  final addressController = AddressController.instance;
  final checkOutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void processOrder(double totalAmount) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing Your Order', TImages.pencilAnimation);

      final userId = AuthenticationRepository.instance.authUser!.uid;

      if (userId.isEmpty) return;

      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.processing,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkOutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      await orderRepository.saveOrder(order, userId);

      cartController.clearCart();
      
      Get.offAll(() => SuccessScreen(image: TImages.orderCompletedAnimation, title: 'Payment Success', subtitle: 'Your Item Delivered Soon',
      onPressed: () => Get.offAll(() => const NavigationMenuBar()),
      ));
      
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }
}
