import 'package:flutter/material.dart';
import 'package:t_store/feature/personalization/controllers/address_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../../common/widget/text/section_heading_text.dart';

class BillingAddressMethod extends StatelessWidget {
  const BillingAddressMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeadingText(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () => addressController.selectedNewAddressPopUp(context),
        ),
        addressController.selectedAddress.value.id.isNotEmpty
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tanbir Coding',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems / 2,
                      ),
                      Text(
                        "+88019371713",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_history,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems / 2,
                      ),
                      Text(
                        "DokinhKhan Ainusbag, Dhaka-1230",
                        style: Theme.of(context).textTheme.bodyMedium,
                        softWrap: true,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  )
                ],
              )
            : Text(
                'Select Address',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
      ],
    );
  }
}
