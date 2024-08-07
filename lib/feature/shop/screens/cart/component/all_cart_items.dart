import 'package:flutter/cupertino.dart';

import '../../../../../common/widget/product/cart/cart_add_remove_button.dart';
import '../../../../../common/widget/product/cart/cart_item.dart';
import '../../../../../common/widget/text/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class AllCartItems extends StatelessWidget {
  final bool showAddRemoveButton;
  const AllCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemCount: 5,
      itemBuilder: (_, index) =>  Column(
        children: [
          /// Cart Item
          const CartItem(),
          if(showAddRemoveButton) const SizedBox(height: TSizes.spaceBtwItems,),
          /// Add & Remove With Total Price
          if(showAddRemoveButton) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  /// Extra Space
                  SizedBox(width: 70,),
                  /// Add Remove Button
                  CartAddRemoveButton(),

                ],
              ),
              ProductPriceText(price: '254')
            ],
          )
        ],
      ),
    );
  }
}