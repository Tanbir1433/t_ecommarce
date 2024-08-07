import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widget/appbar/custom_appbar.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: Text('Add New Address'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.user,
                    ),
                    labelText: 'Name'
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Iconsax.mobile,
                      ),
                      labelText: 'Phone Number'
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Iconsax.building_31,
                            ),
                            labelText: 'Street'
                        ),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields,),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Iconsax.code,
                            ),
                            labelText: 'Postal Code'
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration:  const InputDecoration(
                            prefixIcon: Icon(
                              Iconsax.building,
                            ),
                            labelText: 'city'
                        ),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields,),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Iconsax.activity,
                            ),
                            labelText: 'state'
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields,),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Iconsax.global,
                      ),
                      labelText: 'Country'
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields * 2,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){},child: const Text("Save"),),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
