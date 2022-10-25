import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditCardController extends GetxController {
  @override
  void onInit() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.onInit();
  }

  RxString cardNumber = ''.obs;
  RxString expiryDate = ''.obs;
  RxString cardHolderName = ''.obs;
  RxString cvvCode = ''.obs;
  RxBool isCvvFocused = false.obs;
  RxBool useGlassMorphism = false.obs;
  RxBool useBackgroundImage = true.obs;
  OutlineInputBorder? border;
  final Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  validateCard() {
    if (formKey.value.currentState!.validate()) {
      print('valid!');
    } else {
      print('invalid!');
    }
    update();
  }
}
