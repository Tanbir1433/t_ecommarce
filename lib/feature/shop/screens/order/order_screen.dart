import 'package:flutter/material.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/utils/constants/sizes.dart';

import 'component/order_list_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text("My Order",style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        /// Order
        child: OrderListItem(),
      ),
    );
  }
}


