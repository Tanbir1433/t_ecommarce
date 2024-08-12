import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/feature/authentication/screens/singup/component/terms_condition_check.dart';
import 'package:t_store/feature/authentication/screens/singup/verify_screen/verify_email_screen.dart';
import 'package:t_store/utils/validators/validation.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/singup/singup_controller.dart';

class SingUpForm extends StatelessWidget {
  const SingUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SingUpController());
    return Form(
      key: controller.singUpFormKey,
      child: Column(
        children: [
          /// first & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.fastName,
                  validator: (value) =>
                      TValidator.validateEmptyText("First Name", value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      TValidator.validateEmptyText("Last Name", value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          ///User Name
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                TValidator.validateEmptyText("User Name", value),
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          ///Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// Terms & Condition check Box
          const TermsConditionCheck(),

          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// Sing Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.singUp();
              },
              child: const Text(
                TTexts.createAccount,
              ),
            ),
          )
        ],
      ),
    );
  }
}
