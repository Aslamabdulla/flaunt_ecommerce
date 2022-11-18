import 'package:flaunt_ecommenrce/model/addres_model/address_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/constants/constants.dart';

class AddressController extends GetxController {
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> stateController = TextEditingController().obs;
  Rx<TextEditingController> pinCodeController = TextEditingController().obs;
  validator() {
    if (nameController.value.text.isEmpty ||
        phoneController.value.text.isEmpty ||
        addressController.value.text.isEmpty ||
        cityController.value.text.isEmpty ||
        stateController.value.text.isEmpty ||
        pinCodeController.value.text.isEmpty) {
      Get.snackbar("Error", "Please Fill All fields", colorText: kRedAccent);
      return false;
    } else {
      return true;
    }
  }

  addAddressToFirebase() async {
    update();
  }

  updateAddress() async {
    await FirebaseDatabase.addAddress(AddressModel(
        name: nameController.value.text,
        phone: phoneController.value.text,
        address: addressController.value.text,
        city: cityController.value.text,
        state: stateController.value.text,
        pincode: pinCodeController.value.text));
    clearTextAddress();
    Get.snackbar("Success", "ADDRESS ADDED SUCCESSFULLY",
        colorText: kGreenAccent);
  }

  clearTextAddress() {
    nameController.value.clear();
    phoneController.value.clear();
    addressController.value.clear();
    cityController.value.clear();
    stateController.value.clear();
    pinCodeController.value.clear();
  }
}
