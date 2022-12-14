// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flaunt_ecommenrce/model/order_model/order_model.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/screens/my_cart/widget.dart/shipping_fee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flaunt_ecommenrce/dependency/dependency.dart';

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
    final height = ScreenUtil().screenHeight;
    final width = ScreenUtil().screenWidth;

    TextEditingController offerController = TextEditingController();
    double total = 0;
    // double sum = 0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "MY CART",
          style: textStyleSize(20.sp, FontWeight.w600),
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
                  stream: FirebaseDatabase.readCart(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("ITEM ALREADY IN CART"),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    } else if (snapshot.data == null) {
                      return Center(
                        child: TextButton.icon(
                            onPressed: () {},
                            icon:
                                const Icon(Icons.remove_shopping_cart_outlined),
                            label: const Text("EMPTY CART")),
                      );
                    } else if (snapshot.data!.docs.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.remove_shopping_cart_outlined,
                                  color: kRedAccent,
                                ),
                                label: Text(
                                  "EMPTY CART",
                                  style: textStyleSize(18, FontWeight.w600),
                                )),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          const RowWidget(
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
                                final cartProducts = OrderModel.fromMap(
                                    snapshot.data!.docs[index].data());

                                cartController.orderList.value.where((orders) {
                                  return orders.productId ==
                                      cartProducts.productId;
                                }).isEmpty
                                    ? cartController.orderList.add(cartProducts)
                                    : null;

                                return CartListTileWidget(
                                  snapshot: snapshot,
                                  images: cartProducts.imageUrl,
                                  index: index,
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10.sp,
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
                          ShippingRowWidget(
                              leading: "Shipping fee",
                              size1: 14,
                              size2: 15,
                              left: 25),
                          TotalPriceRowWidget(
                              left: 25,
                              leading: "Total",
                              trailing: 0.toString(),
                              size1: 16,
                              size2: 18),
                          kHeight20,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: LoginButtonWidget(
                              name: "Proceed To Checkout",
                              height: height * .06.h,
                              width: width,
                              fnctn: () => Get.to(() => CheckoutScreen(
                                    billableprice:
                                        cartController.totalPriceCart.value,
                                  )),
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
