import 'package:flutter/material.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widget/product/sortable/sortable_products.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text('Popular Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: SortableProduct(),
        ),
      ),
    );
  }
}


