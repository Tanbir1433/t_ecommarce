import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/loaders/animation_loader.dart';
import 'package:t_store/feature/shop/controllers/product/order_controller.dart';
import 'package:t_store/navigation_menu_bar.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(OrderController());
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {

          final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! No order yet',
            animation: TImages.orderCompletedAnimation,
            showAction: true,
            actionText: 'Let\'s Shopping More',
            onActionPressed: () => Get.offAll(() => const NavigationMenuBar()),
          );

          final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,nothingFound: emptyWidget);
          if(response != null) return response;

          final orders = snapshot.data!;

          return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems,),
            itemCount: orders.length,
            itemBuilder: (_, index) {
              final order = orders[index];
              return Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
                    side: const BorderSide(color: Colors.grey)),
                color: dark ? TColors.dark : TColors.light,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.md),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Row-1
                      Row(
                        children: [
                          /// Icon
                          const Icon(Iconsax.ship),
                          const SizedBox(
                            width: TSizes.spaceBtwItems / 2,
                          ),

                          /// Status & Date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.orderStatusText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(
                                      color: TColors.primary,
                                      fontWeightDelta: 1),
                                ),
                                Text(
                                  order.formattedOrderDate,
                                  style:
                                  Theme.of(context).textTheme.headlineSmall,
                                )
                              ],
                            ),
                          ),

                          /// IconButton
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Iconsax.arrow_right_34,
                                size: TSizes.iconSm,
                              ))
                        ],
                      ),

                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// Row-2
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                /// Icon
                                const Icon(Iconsax.tag),
                                const SizedBox(
                                  width: TSizes.spaceBtwItems / 2,
                                ),

                                /// Status & Date
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                      Text(
                                        order.id,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                /// Icon
                                const Icon(Iconsax.calendar),
                                const SizedBox(
                                  width: TSizes.spaceBtwItems / 2,
                                ),

                                /// Status & Date
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Shipping Date',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                      Text(
                                        order.formattedDeliveryDate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
