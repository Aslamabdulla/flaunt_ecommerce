// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flaunt_ecommenrce/controller/cart_controller/cart_controller.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/model/product.dart';
import 'package:flaunt_ecommenrce/model/product_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/cart_list_tile.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/checkout_page/check_out.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/row_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/my_cart/widget.dart/price_tile_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/my_cart/widget.dart/promo_tile_widget.dart';

class MyCartScreen extends StatelessWidget {
  final double totalBill;
  const MyCartScreen({
    Key? key,
    required this.totalBill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    final height = Get.height;
    final width = Get.width;

    TextEditingController offerController = TextEditingController();
    double total = 0;
    // double sum = 0;
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
              child: StreamBuilder(
                  stream: FirebaseDatabase.readCart(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("ITEM ALREADY IN CART"),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CupertinoActivityIndicator(),
                      );
                    } else if (snapshot.data == null) {
                      return Center(
                        child: Text("NO ITEM IN CART"),
                      );
                    } else {
                      return GetBuilder<CartController>(
                          init: CartController(),
                          builder: (cartCtrl) {
                            return Column(
                              children: [
                                RowWidget(
                                  text: "MY CART",
                                  top: 15,
                                  left: 15,
                                  fontSize: 18,
                                  mainAxis: MainAxisAlignment.spaceBetween,
                                ),
                                ListView.separated(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemBuilder: (context, index) {
                                      final cartProducts =
                                          ProductModel.fromJson(
                                              json: snapshot.data!.docs[index]
                                                  .data());
                                      final String price = cartProducts.price;
                                      final String quantity =
                                          cartProducts.quantity;

                                      // final double itemPrice =
                                      //     double.parse(price);
                                      // final int itemQuantity =
                                      //     int.parse(quantity);
                                      // total = itemPrice * itemQuantity;

                                      // cartController.stringToDouble(
                                      //     price, quantity);
                                      final List imageUrl =
                                          cartProducts.imageUrl;

                                      return CartListTileWidget(
                                        snapshot: snapshot,
                                        images: imageUrl,
                                        index: index,
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          height: 10,
                                        ),
                                    itemCount: snapshot.data!.docs.length),
                                kHeight15,
                                PromoCodeTileWidget(
                                  offerController: offerController,
                                ),
                                TotalPriceRowWidget(
                                    left: 25,
                                    leading: "Sub Total",
                                    trailing: 2500.toString(),
                                    size1: 15,
                                    size2: 16),
                                TotalPriceRowWidget(
                                    left: 25,
                                    leading: "Shipping Fee",
                                    trailing: 0.toString(),
                                    size1: 12,
                                    size2: 14),
                                ValueListenableBuilder(
                                    valueListenable:
                                        cartController.priceCartListenable,
                                    builder: (context, value, _) {
                                      return TotalPriceRowWidget(
                                          left: 25,
                                          leading: "Total",
                                          trailing: totalBill.toString(),
                                          size1: 16,
                                          size2: 18);
                                    }),
                                kHeight20,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: LoginButtonWidget(
                                    name: "Proceed To Checkout",
                                    height: height * .06,
                                    width: width,
                                    fnctn: () => Get.to(() => CheckoutScreen()),
                                  ),
                                ),
                                kHeight15,
                              ],
                            );
                          });
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
