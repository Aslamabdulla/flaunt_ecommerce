// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/payment_success/payment_success.dart';
import 'package:flaunt_ecommenrce/view/screens/checkout_page/widgets/text_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/my_cart/widget.dart/price_tile_widget.dart';
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/checkout_page/widgets/address_tile_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/checkout_page/widgets/payment_button.dart';
import 'package:flaunt_ecommenrce/view/screens/checkout_page/widgets/payment_methods.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/row_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
              height: height / 1.7,
              decoration: customClipperBackground,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RowWidget(
                    text: "Delivery to",
                    top: 20,
                    left: 15,
                    fontSize: 15,
                    mainAxis: MainAxisAlignment.spaceBetween,
                  ),
                  kHeight15,
                  AddressTileWidget(),
                  RowWidget(
                    text: "Payment Methods",
                    top: 15,
                    left: 15,
                    fontSize: 16,
                    mainAxis: MainAxisAlignment.spaceBetween,
                  ),
                  kHeight10,
                  PaymentMethods(),
                  Column(
                    children: [
                      RowWidget(
                        text: "Fees Breakup",
                        top: 10,
                        left: 30,
                        fontSize: 18,
                        mainAxis: MainAxisAlignment.spaceBetween,
                      ),
                      kHeight10,
                      TotalPriceRowWidget(
                          left: 30,
                          leading: "Amount",
                          trailing: "₹3000",
                          size1: 15,
                          size2: 16),
                      TotalPriceRowWidget(
                          left: 30,
                          leading: "Gateway Fees",
                          trailing: "₹0",
                          size1: 15,
                          size2: 16),
                      TotalPriceRowWidget(
                          left: 30,
                          leading: "GST on Gateway Fees",
                          trailing: "₹0",
                          size1: 15,
                          size2: 16),
                      SizedBox(
                        width: width - 30,
                        child: Divider(
                          height: 30,
                        ),
                      ),
                      TotalPriceRowWidget(
                          left: 35,
                          leading: "TOTAL",
                          trailing: "₹3000",
                          size1: 18,
                          size2: 18),
                      kHeight30,
                      LoginButtonWidget(
                          name: "Pay",
                          height: height * .06,
                          width: width - 50,
                          fnctn: () => Get.to(() => PaymentSuccessScreen()))
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
