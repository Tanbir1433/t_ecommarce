import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/dividers.dart';
import 'package:t_store/common/widget/social_button.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'component/singup_form.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Form
              const SingUpForm(),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Divider
              Dividers(dividerText: TTexts.orSignUpWith.capitalize!),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Social Button
              const SocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
