import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/loaders/circular_loader.dart';
import 'package:t_store/common/widget/text/section_heading_text.dart';
import 'package:t_store/data/repositories/address/address_repository.dart';
import 'package:t_store/feature/personalization/model/address_model.dart';
import 'package:t_store/feature/personalization/screens/address/component/add_new_address.dart';
import 'package:t_store/feature/personalization/screens/address/component/single_address.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();

  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final address = await addressRepository.fetchUserAddresses();
      selectedAddress.value = address.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());

      return address;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const TCircularLoader(),
      );

      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }

      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future addNewAddresses() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Storing Address', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );

      final id = await addressRepository.addAddress(address);

      address.id = id;
      await selectAddress(address);

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: 'Congratulations!',
          message: 'Your Address has been Saved Successfully');

      refreshData.toggle();

      resetFormFields();

      Navigator.of(Get.context!).pop();
    } catch (e) {}
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

  Future<dynamic> selectedNewAddressPopUp(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: const EdgeInsets.all(TSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeadingText(title: 'Selected Address',showActionButton: false,),
            FutureBuilder(
              future: getAllUserAddresses(),
              builder: (_, snapshot) {

                final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                if (response != null) return response;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => SingleAddress(
                    address: snapshot.data![index],
                    onTap: () {
                      selectedAddress(snapshot.data![index]);
                      Get.back();
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: TSizes.defaultSpace * 2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const AddNewAddress()),
                child: const Text("Add New Address"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
