import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import '../../../../common/widget/product/sortable/sortable_products.dart';
import '../../../../utils/shimmer/vertical_shimmer.dart';
import '../../controllers/product/all_product_controller.dart';
import '../../model/product_model.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: CustomAppbar(showBackArrow: true, title: Text(title),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {

              const loader = VerticalShimmer();

              final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);

              if(widget!=null) return widget;
              final products = snapshot.data!;
              return SortableProduct(products: products,);
            }
          ),
        ),
      ),
    );
  }
}


