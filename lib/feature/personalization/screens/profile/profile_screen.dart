import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/common/widget/image/circular_image.dart';
import 'package:t_store/common/widget/text/section_heading_text.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import 'component/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const CircularImage(image: TImages.user,width: 80,height: 80,),
                    TextButton(onPressed: (){}, child: const Text("Change Profile Picture"))
                  ]
                ),
              ),

              /// Details
              const SizedBox(
                height: TSizes.spaceBtwItems/2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const SectionHeadingText(title: "Profile Information",showActionButton: false,),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ProfileMenu(onPressed: () {  }, title: 'Names', Value: 'Tanbir',),
              ProfileMenu(onPressed: () {  }, title: 'User Names', Value: 'Tanbir Hossain',),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const SectionHeadingText(title: "Profile Information",showActionButton: false,),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ProfileMenu(onPressed: () {  }, title: 'User Id',icon: Iconsax.copy, Value: '1234',),
              ProfileMenu(onPressed: () {  }, title: 'E-mail', Value: 'Tanbir@gmail.com',),
              ProfileMenu(onPressed: () {  }, title: 'Phone Number', Value: '01909371713',),
              ProfileMenu(onPressed: () {  }, title: 'gender', Value: 'Male',),
              ProfileMenu(onPressed: () {  }, title: 'Date Of Birth', Value: '10 Nov 2001',),
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
                  onPressed: (){},
                  child: const Text("Close Account",style: TextStyle(color: Colors.red),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
