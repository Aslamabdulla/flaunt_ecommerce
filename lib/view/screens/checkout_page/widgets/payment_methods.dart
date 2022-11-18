// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:flaunt_ecommenrce/controller/payment_controller/payment_controller.dart';
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
      margin: EdgeInsets.fromLTRB(15, 0, 15, height * .13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton.icon(
              onPressed: () {
                paymentController.dispatchPayment(
                    billablePrice, "hello", "Paytm", "hello@gmail.com");
              },
              icon: Icon(Icons.payment),
              label: Text("Razorpay"))
        ],
      ),
    );
  }
}
