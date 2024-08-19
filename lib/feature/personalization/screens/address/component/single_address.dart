import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/feature/personalization/controllers/address_controller.dart';
import 'package:t_store/feature/personalization/model/address_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class SingleAddress extends StatelessWidget {
  final AddressModel address;
  final VoidCallback onTap;

  const SingleAddress({super.key, required this.address, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;
    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
          child: SizedBox(
            width: double.infinity,
            child: Material(
              color: selectedAddress
                  ? TColors.primary.withOpacity(0.5)
                  : Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(TSizes.md),
                  side: BorderSide(
                    color: selectedAddress
                        ? Colors.transparent
                        : dark
                        ? TColors.darkerGrey
                        : TColors.grey,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Stack(
                  children: [
                    Positioned(
                      right: 5,
                      top: 0,
                      child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                          color: selectedAddress
                              ? dark
                              ? TColors.light
                              : TColors.dark
                              : null),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          address.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge,
                        ),
                        const SizedBox(
                          height: TSizes.sm / 2,
                        ),
                        Text(
                          address.formattedPhoneNumber,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: TSizes.sm / 2,
                        ),
                        Text(
                          address.toString(),
                          softWrap: true,)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
