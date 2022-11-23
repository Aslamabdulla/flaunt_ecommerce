// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/model/order_model.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/screens/account/widgets/order_tile_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/delivery_status/delivery_status.dart';
import 'package:flaunt_ecommenrce/view/screens/home_bottom_navigation/home_navigation.dart';
import 'package:flaunt_ecommenrce/view/screens/my_cart/widget.dart/shipping_fee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flaunt_ecommenrce/controller/cart_controller/cart_controller.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/model/cart_model.dart';
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

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;

    TextEditingController offerController = TextEditingController();
    double total = 0;
    // double sum = 0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "MY ORDERS",
          style: textStyleSize(20, FontWeight.w600),
        ),
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
                  stream: FirebaseDatabase.readorders(),
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
                        child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.remove_shopping_cart_outlined),
                            label: Text("NO ORDERS")),
                      );
                    } else if (snapshot.data!.docs.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.remove_shopping_cart_outlined,
                                  color: kRedAccent,
                                ),
                                label: Text(
                                  "NO ORDERS",
                                  style: textStyleSize(18, FontWeight.w600),
                                )),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          RowWidget(
                            text: "MY CART",
                            top: 15,
                            left: 15,
                            fontSize: 18,
                            mainAxis: MainAxisAlignment.spaceBetween,
                          ),
                          kHeight10,
                          ListView.separated(
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (context, index) {
                                final cartProducts = OrderModel.fromMap(
                                    snapshot.data!.docs[index].data());
                                final id = snapshot.data!.docs[index].id;
                                // cartController.orderList.value.where((orders) {
                                //   return orders.productId ==
                                //       cartProducts.productId;
                                // }).isEmpty
                                //     ? cartController.orderList.add(cartProducts)
                                //     : null;

                                return GestureDetector(
                                  onTap: () => Get.to(() => DeliveryStatusScren(
                                        orderModel: cartProducts,
                                        id: id,
                                      )),
                                  child: OrderTileWidget(
                                    snapshot: snapshot,
                                    images: cartProducts.imageUrl,
                                    index: index,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10,
                                  ),
                              itemCount: snapshot.data!.docs.length),
                          kHeight45,
                          kHeight45,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: LoginButtonWidget(
                              name: "HOMEPAGE",
                              height: height * .06,
                              width: width,
                              fnctn: () =>
                                  Get.offAll(() => HomeNavigationPage()),
                            ),
                          ),
                          kHeight15,
                        ],
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
