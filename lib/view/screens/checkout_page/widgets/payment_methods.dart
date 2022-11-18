import 'package:flaunt_ecommenrce/controller/payment_controller/payment_controller.dart';
import 'package:flaunt_ecommenrce/view/screens/checkout_page/widgets/payment_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentMethods extends StatelessWidget {
  PaymentMethods({
    Key? key,
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
                    200, "hello", "Paytm", "hello@gmail.com");
              },
              icon: Icon(Icons.payment),
              label: Text("Razorpay"))
        ],
      ),
    );
  }
}
