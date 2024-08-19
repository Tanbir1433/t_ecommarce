import 'package:get/get.dart';
import 'package:t_store/common/widget/product/cart/cart_counter.dart';
import 'package:t_store/feature/shop/controllers/product/cart_item_controller.dart';
import 'package:t_store/feature/shop/controllers/product/image_controller.dart';
import 'package:t_store/feature/shop/model/product_model.dart';
import 'package:t_store/feature/shop/model/product_verification_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  /// Variable
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  /// Selected Attribute & Value
  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {

    final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;

    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) =>
          _isSameAttributeValue(variation.attributeValue, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    if (selectedVariation.image.isNotEmpty) {
      ImageController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    if(selectedVariation.id.isNotEmpty){
      final cartController = CartItemController.instance;
      cartController.productQuantityInCart.value = cartController.getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    this.selectedVariation.value = selectedVariation;

    getProductVariationStockStatus();
  }

  /// check if selected attribute match with other variation
  bool _isSameAttributeValue(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  /// Check Attribute availability
  Set<String?> getAttributeAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributeValue = variations
        .where((variation) =>
            variation.attributeValue[attributeName] != null &&
            variation.attributeValue[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        .map((variation) => variation.attributeValue[attributeName])
        .toSet();

    return availableVariationAttributeValue;
  }

  String getVariationPrice(){
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }

  /// Check Product Variation Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out Of Stock';
  }


  /// Reset Selected Attribute when Switching Product
  void resetSelectedAttribute() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
