// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/view/screens/my_cart/widget.dart/shipping_fee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/checkout_page/widgets/address_tile_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/checkout_page/widgets/payment_button.dart';
import 'package:flaunt_ecommenrce/view/screens/checkout_page/widgets/payment_methods.dart';
import 'package:flaunt_ecommenrce/view/screens/checkout_page/widgets/text_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/row_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/my_cart/widget.dart/price_tile_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/payment_success/payment_success.dart';

class CheckoutScreen extends StatelessWidget {
  final double billableprice;
  const CheckoutScreen({
    Key? key,
    required this.billableprice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil().screenHeight;
    final width = ScreenUtil().screenWidth;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: kBlack,
        title: Text(
          "CHECKOUT",
          style: textStyleSize(18, FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ClipPath(
            clipper: ClipperPath(),
            child: Container(
              height: height / 1.7.h,
              decoration: customClipperBackground,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RowWidget(
                    text: "Delivery to",
                    top: 15,
                    left: 15,
                    fontSize: 15.sp,
                    mainAxis: MainAxisAlignment.spaceBetween,
                  ),
                  kHeight10,
                  const AddressTileWidget(),
                  RowWidget(
                    text: "Payment Methods",
                    top: 10,
                    left: 15,
                    fontSize: 16.sp,
                    mainAxis: MainAxisAlignment.spaceBetween,
                  ),
                  kHeight5,
                  PaymentMethods(billablePrice: billableprice),
                  Column(
                    children: [
                      RowWidget(
                        text: "Fees Breakup",
                        top: 10,
                        left: 30,
                        fontSize: 18.sp,
                        mainAxis: MainAxisAlignment.spaceBetween,
                      ),
                      kHeight10,
                      TotalPriceRowWidget(
                          left: 30,
                          leading: "Amount",
                          trailing: 0.toString(),
                          size1: 15,
                          size2: 16),
                      ShippingRowWidget(
                          leading: "Gateway Fees",
                          size1: 15,
                          size2: 16,
                          left: 30),
                      ShippingRowWidget(
                          leading: "GST on Gateway Fees",
                          size1: 15,
                          size2: 16,
                          left: 30),
                      SizedBox(
                        width: width - 30.w,
                        child: Divider(
                          height: 30.h,
                        ),
                      ),
                      TotalPriceRowWidget(
                          left: 35,
                          leading: "TOTAL",
                          trailing: 0.toString(),
                          size1: 18,
                          size2: 18),
                      kHeight10,
                      LoginButtonWidget(
                          name: "Pay",
                          height: height * .06.h,
                          width: width - 50.h,
                          fnctn: () {
                            if (cartController.address.isNotEmpty) {
                              return paymentController.dispatchPayment(
                                  cartController.totalPriceCart.value,
                                  "hello",
                                  "Paytm",
                                  "hello@gmail.com");
                            } else {
                              Get.snackbar("PROMPT", "PLEASE ADD ADDRESS");
                            }
                          })
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
