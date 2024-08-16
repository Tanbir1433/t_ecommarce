import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/common/widget/image/circular_image.dart';
import 'package:t_store/common/widget/text/section_heading_text.dart';
import 'package:t_store/feature/personalization/screens/profile/component/change_name_screen.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/shimmer/tshimmer_effect.dart';

import '../../controllers/user/user_controller.dart';
import 'component/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const CustomAppbar(
        title: Text("Profile"),
        showBackArrow: true,
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                    children: [
                      Obx(() {
                        final networkImage = controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty ? networkImage : TImages.user;

                        return controller.imageUploading.value
                            ? const TShimmerEffect(width: 80, height: 80,radius: 80,)
                            : CircularImage(image: image, width: 80, height: 80,isNetworkImage: networkImage.isNotEmpty,borderRadius: 80,);
                      }),
                      TextButton(onPressed: () =>
                          controller.uploadUserProfilePicture(),
                          child: const Text("Change Profile Picture"))
                    ]
                ),
              ),

              /// Details
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const SectionHeadingText(
                title: "Profile Information", showActionButton: false,),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ProfileMenu(onPressed: () {
                Get.to(() => const ChangeNameScreen());
              }, title: 'Name', Value: controller.user.value.fullName,),
              ProfileMenu(onPressed: () {},
                title: 'User Names',
                Value: controller.user.value.userName,),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const SectionHeadingText(
                title: "Profile Information", showActionButton: false,),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ProfileMenu(onPressed: () {},
                title: 'User Id',
                icon: Iconsax.copy,
                Value: controller.user.value.id,),
              ProfileMenu(onPressed: () {},
                title: 'E-mail',
                Value: controller.user.value.email,),
              ProfileMenu(onPressed: () {},
                title: 'Phone Number',
                Value: controller.user.value.phoneNumber,),
              ProfileMenu(onPressed: () {}, title: 'gender', Value: 'Male',),
              ProfileMenu(onPressed: () {},
                title: 'Date Of Birth',
                Value: '10 Nov 2001',),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopUp(),
                  child: const Text(
                    "Close Account", style: TextStyle(color: Colors.red),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
