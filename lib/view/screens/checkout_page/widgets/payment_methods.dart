// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/screens/payment_success/payment_success.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:flaunt_ecommenrce/controller/payment_controller/payment_controller.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/checkout_page/widgets/payment_button.dart';

class PaymentMethods extends StatelessWidget {
  final double billablePrice;
  PaymentMethods({
    Key? key,
    required this.billablePrice,
  }) : super(key: key);
  final PaymentController paymentController = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 10, height * .08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                if (cartController.address.value.isNotEmpty) {
                  paymentController.dispatchPayment(
                      billablePrice, "hello", "Paytm", "hello@gmail.com");
                } else {
                  Get.snackbar("Prompt", "PLEASE ADD ADDRESS");
                }
              },
              child: PaymentWidget(
                image: "assets/images/paymentButton/razorpay.png",
              )),
          kWidth15,
          GestureDetector(
              onTap: () {
                if (cartController.address.value.isNotEmpty) {
                  cartController.checkBool.value = false;
                  cartController.addOrdersToDb();
                  Get.offAll(() => PaymentSuccessScreen());
                } else {
                  Get.snackbar("Prompt", "PLEASE ADD ADDRESS");
                }
              },
              child:
                  PaymentWidget(image: "assets/images/paymentButton/cod.png"))
        ],
      ),
    );
  }
}

class PaymentWidget extends StatelessWidget {
  final String image;
  const PaymentWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(),
          color: kWhite,
          image:
              DecorationImage(fit: BoxFit.contain, image: AssetImage(image))),
    );
  }
}
