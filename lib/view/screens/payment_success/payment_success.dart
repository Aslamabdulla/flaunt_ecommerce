import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/account/widgets/my_orders.dart';
import 'package:flaunt_ecommenrce/view/screens/delivery_status/delivery_status.dart';
import 'package:flaunt_ecommenrce/view/screens/home_bottom_navigation/home_navigation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil().screenHeight;
    final width = ScreenUtil().screenWidth;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kBlack,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.task_alt,
              color: Colors.green,
              size: 50,
            ),
            kHeight15,
            const Text("PAYMENT SUCCESS"),
            kHeight15,
            const Text("Payment Completed"),
            RichText(
              text: TextSpan(
                  text: 'Your Order Number Is ',
                  style: const TextStyle(
                      color: kBlack, fontSize: 18, fontFamily: 'Oswald'),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'FLNT${cartController.orderNumber.value}',
                      style: TextStyle(
                          color: kBlack,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald'),
                    )
                  ]),
            ),
            kHeight15,
            LoginButtonWidget(
                name: "MY ORDERS",
                height: height * .06.sp,
                width: width,
                fnctn: () => Get.to(const MyOrdersScreen())),
            kHeight15,
            GestureDetector(
                onTap: () => Get.offAll(() => const HomeNavigationPage()),
                child: const Text("Homepage"))
          ],
        ),
      ),
    );
  }
}
