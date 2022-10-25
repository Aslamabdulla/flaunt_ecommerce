// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/checkout_page/check_out.dart';
import 'package:flaunt_ecommenrce/view/screens/my_cart/widget.dart/price_tile_widget.dart';
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/cart_list_tile.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/row_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/text_form_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/my_cart/widget.dart/promo_code.dart';
import 'package:flaunt_ecommenrce/view/screens/my_cart/widget.dart/promo_tile_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/counter_cart.dart';
import 'package:get/get.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController offerController = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
                    text: "MY CART",
                    top: 15,
                    left: 15,
                    fontSize: 18,
                    mainAxis: MainAxisAlignment.spaceBetween,
                  ),
                  CartListTileWidget(images: cartImages),
                  kHeight15,
                  PromoCodeTileWidget(
                    offerController: offerController,
                  ),
                  TotalPriceRowWidget(
                      left: 25,
                      leading: "Sub Total",
                      trailing: "₹3000",
                      size1: 15,
                      size2: 16),
                  TotalPriceRowWidget(
                      left: 25,
                      leading: "Shipping Fee",
                      trailing: "Free",
                      size1: 12,
                      size2: 14),
                  TotalPriceRowWidget(
                      left: 25,
                      leading: "Total",
                      trailing: "₹3000",
                      size1: 16,
                      size2: 18),
                  kHeight20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: LoginButtonWidget(
                      name: "Proceed To Checkout",
                      height: height * .06,
                      width: width,
                      fnctn: () => Get.to(() => CheckoutScreen()),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
