import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/feature/personalization/controllers/user/update_name_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text("Change Name",style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text("Use real name for easy verification, this name will use several page",style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: TSizes.spaceBtwSections,),

            Form(
              key: controller.updateUserNameKey,
              child: Column(
              children: [
                TextFormField(
                  controller: controller.firstName,
                  validator: (value) => TValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: TTexts.firstName,prefixIcon: Icon(Iconsax.user)),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields,),
                TextFormField(
                  controller: controller.lastName,
                  validator: (value) => TValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: TTexts.lastName,prefixIcon: Icon(Iconsax.user)),
                ),
              ],
            ),
            ),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text("Save"),
              ),
            )

          ],
        ),
      ),
    );
  }
}
