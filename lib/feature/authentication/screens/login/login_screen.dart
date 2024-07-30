import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/style/spacing_style.dart';
import 'package:t_store/common/widget/dividers.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'component/login_form.dart';
import 'component/login_header.dart';
import '../../../../common/widget/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppbarHeight,
          child: Column(
            children: [
              /// Logo, Title & SubTitle
              const LoginHeader(),

              /// Input Form
              const LoginForm(),

              /// Divider
              Dividers(dividerText: TTexts.orSignInWith.capitalize!),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Footer
              const SocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
