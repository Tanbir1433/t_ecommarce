import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/feature/personalization/controllers/user/user_controller.dart';
import 'package:t_store/utils/shimmer/tshimmer_effect.dart';
import '../../../../../common/widget/appbar/custom_appbar.dart';
import '../../../../../common/widget/product/cart/cart_counter.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return CustomAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                return const TShimmerEffect(width: 80, height: 15);
              } else {
                return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),);
              }
            },
          ),
        ],
      ),
      actions: [
        CartCounter(
          onPressed: () {},
          iconColor: TColors.white,
        )
      ],
    );
  }
}
