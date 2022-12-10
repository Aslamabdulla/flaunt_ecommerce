// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/model/cart_model/cart_model.dart';
import 'package:flaunt_ecommenrce/model/order_model/order_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/delivery_status/delivery_status.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/counter_cart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderTileWidget extends StatelessWidget {
  final List images;
  final int index;
  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;
  OrderTileWidget({
    Key? key,
    required this.images,
    required this.index,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProducts = OrderModel.fromMap(snapshot.data!.docs[index].data());
    var id = snapshot.data!.docs[index].id;
    final height = ScreenUtil().screenHeight;
    final width = ScreenUtil().screenWidth;

    return Container(
      height: height * .3,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: glassDecorationCustom(Colors.white54, Colors.white30),
      child: Column(
        children: [
          kHeight10,
          Row(
            children: [
              Container(
                height: height / 5.h,
                width: width / 3.w,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(cartProducts.imageUrl[0]),
                      fit: BoxFit.cover),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kHeight5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(cartProducts.brand.toUpperCase()),
                    ],
                  ),
                  Container(
                    width: width / 2.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          cartProducts.name,
                          style: textStyleSize(18.sp, FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width / 2.2.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${cartProducts.quantity} Qty",
                          style: textStyleSize(16.sp, FontWeight.w500),
                        ),
                        kWidth20,
                        Row(
                          children: [
                            Text(
                              "Color : ",
                              style: textStyleSize(16.sp, FontWeight.w500),
                            ),
                            const CircleAvatar(
                              radius: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹${cartProducts.price}",
                        style: textStyleSize(14.sp, FontWeight.w400),
                      ),
                      kWidth20,
                    ],
                  ),
                  SizedBox(
                    width: width / 2.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOTAL : ₹${cartProducts.total.toString()}",
                          style: textStyleSize(18.sp, FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "ORDER ID : ${cartProducts.orderId}",
                    style: textStyleSize(16.sp, FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
          kHeight15,
          ElevatedButton.icon(
              style: buttonStyleCart(width * .5.w, 50.h, kBlack),
              onPressed: () {
                Get.to(() => DeliveryStatusScren(
                      id: id,
                      orderModel: cartProducts,
                    ));
              },
              icon: const Icon(Icons.flight_land_outlined),
              label: const Text("Track Order")),
        ],
      ),
    );
  }
}
