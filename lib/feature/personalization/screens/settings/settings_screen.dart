import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/common/widget/home_header.dart';
import 'package:t_store/common/widget/text/section_heading_text.dart';
import 'package:t_store/feature/personalization/screens/address/address_screen.dart';
import 'package:t_store/feature/personalization/screens/profile/profile_screen.dart';
import 'package:t_store/feature/shop/screens/order/order_screen.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widget/list_tile/settings_menu_tile.dart';
import '../../../../common/widget/user_profile/user_profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            PrimaryHeader(
              child: Column(
                children: [
                  /// AppBar
                  CustomAppbar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),


                  /// User Profile Card
                  UserProfile(onTap: () {
                    Get.to(() => const ProfileScreen());
                  },),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Account Settings
                  const SectionHeadingText(title: "Account Settings",showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  SettingsMenuTile(icon: Iconsax.safe_home, title: 'My Address', subTitle: "Set Shopping Delivery Address", onTap: (){Get.to(() => const AddressScreen());},),
                  SettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: "Add Remove Products And Move to CheckOut", onTap: (){},),
                  SettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: "In-Progress and Complete Order", onTap: (){Get.to(() => const OrderScreen()); },),
                  SettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subTitle: "Withdraw Balance to Registered Bank Account", onTap: (){},),
                  SettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: "List All Off the Discount Coupons", onTap: (){},),
                  SettingsMenuTile(icon: Iconsax.notification, title: 'Notification', subTitle: "Set Any kind of Notification Message", onTap: (){},),
                  SettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: "Manage data Usage and Connected Accounts", onTap: (){},),

                  /// App Settings
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const SectionHeadingText(title: "App Settings",showActionButton: false,),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: "Upload data to Your Cloud Firebase", onTap: (){},),
                  SettingsMenuTile(icon: Iconsax.location, title: 'GeoLocation', subTitle: "Set Recommendation Based on Location", onTap: (){},trailing: Switch(value: true,onChanged: (vale){},),),
                  SettingsMenuTile(icon: Iconsax.security_user, title: 'Safe Mode', subTitle: "Search Result is Safe for All Age", onTap: (){},trailing: Switch(value: false,onChanged: (vale){},),),
                  SettingsMenuTile(icon: Iconsax.image, title: 'HD Image Quality', subTitle: "Set Image Quality to be Seen", onTap: (){},trailing: Switch(value: false,onChanged: (vale){},),),

                  /// LogOut Button
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: (){},child: const Text("Logout"),),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2.5,
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
