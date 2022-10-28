import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/delivery_status/delivery_status.dart';
import 'package:flaunt_ecommenrce/view/screens/home_bottom_navigation/home_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kBlack,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.task_alt,
              color: Colors.green,
              size: 50,
            ),
            kHeight15,
            Text("PAYMENT SUCCESS"),
            kHeight15,
            Text("Payment Completed"),
            Text("Your order number is #10821"),
            kHeight20,
            LoginButtonWidget(
                name: "Order Delivery Status",
                height: height * .06,
                width: width,
                fnctn: () => Get.to(DeliveryStatusScren())),
            kHeight15,
            Text("Homepage")
          ],
        ),
      ),
    );
  }
}
