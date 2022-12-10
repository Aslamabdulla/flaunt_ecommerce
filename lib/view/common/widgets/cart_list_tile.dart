// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/model/cart_model/cart_model.dart';
import 'package:flaunt_ecommenrce/model/order_model/order_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/counter_cart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartListTileWidget extends StatelessWidget {
  final List images;
  final int index;
  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;
  CartListTileWidget({
    Key? key,
    required this.images,
    required this.index,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProducts =
        CartModel.fromJson(json: snapshot.data!.docs[index].data());
    // var cartProducts =
    //     snapshot.data!.docs[index].data() as Map<String, dynamic>;
    var id = snapshot.data!.docs[index].id;
    print(id);

    final height = ScreenUtil().screenHeight;
    final width = ScreenUtil().screenWidth;

    // cartController.priceCartListenable.value =
    //     cartProducts.total! + cartController.priceCartListenable.value;
    // print(cartController.priceCartListenable.value);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: glassDecorationCustom(Colors.white54, Colors.white30),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: decoration,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: height / 5.h,
            width: width / 3.w,
            child: Image.network(
              cartProducts.imageUrl[0],
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      style: textStyleSize(18, FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                width: width / 2.2.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width / 4.1.w,
                      child: Text(
                        cartProducts.category.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: textStyleSize(16, FontWeight.w500),
                      ),
                    ),
                    kWidth20,
                    Row(
                      children: [
                        Text(
                          "Color : ",
                          style: textStyleSize(16, FontWeight.w500),
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
                    style: textStyleSize(14, FontWeight.w400),
                  ),
                  kWidth20,
                  CounterCartProducts(cartProducts: cartProducts)
                ],
              ),
              SizedBox(
                width: width / 2.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TOTAL : ₹${cartProducts.total.toString()}",
                      style: textStyleSize(18, FontWeight.w600),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                              textCancel: "Cancel",
                              textConfirm: "Remove",
                              onConfirm: () {
                                cartController.deleteItem(docId: id);
                                cartController.orderList.value.removeWhere(
                                    (element) =>
                                        element.productId ==
                                        cartProducts.productId);

                                // Get.back();
                                Get.close(1);
                              },
                              title: "CONFIRM",
                              content: Container(
                                child: const Text("DO YOU WANT TO REMOVE"),
                              ));
                        },
                        icon: const Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.red,
                        ))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CounterCartProducts extends StatelessWidget {
  const CounterCartProducts({
    Key? key,
    required this.cartProducts,
  }) : super(key: key);

  final CartModel cartProducts;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartCountButtonWidget(
            icon: Icons.remove,
            fnctn: () async {
              if (int.parse(cartProducts.quantity) > 1) {
                await FirebaseDatabase.updateToCart(
                    productModel: OrderModel(
                        orderId: "",
                        address: [],
                        userEmail: userEmail,
                        productIndex: "0",
                        date: DateTime.now().toString(),
                        productId: cartProducts.productId,
                        brand: cartProducts.brand,
                        name: cartProducts.name,
                        price: cartProducts.price,
                        category: cartProducts.category,
                        subCategory: cartProducts.subCategory,
                        colors: cartProducts.colors,
                        description: cartProducts.description,
                        imageUrl: cartProducts.imageUrl,
                        isHotAndNew: cartProducts.isHotAndNew,
                        isTrending: cartProducts.isTrending,
                        isSummerCollection: cartProducts.isSummerCollection,
                        isNewArrival: cartProducts.isNewArrival,
                        isHotSales: cartProducts.isHotSales,
                        isPopularBrand: cartProducts.isPopularBrand,
                        quantity:
                            (int.parse(cartProducts.quantity) - 1).toString(),
                        total: double.parse(cartProducts.price) *
                            (int.parse(cartProducts.quantity) - 1)));
              } else {
                Get.snackbar("PROMPT", "Minimum Limit Reached");
              }
            }),
        kWidth5,
        Text(
          cartProducts.quantity,
          style: const TextStyle(fontSize: 18),
        ),
        kWidth5,
        CartCountButtonWidget(
            icon: Icons.add,
            fnctn: () async {
              if (int.parse(cartProducts.quantity) < 10) {
                await FirebaseDatabase.updateToCart(
                    productModel: OrderModel(
                        orderId: "",
                        address: [],
                        date: DateTime.now().toString(),
                        userEmail: userEmail,
                        productIndex: "0",
                        productId: cartProducts.productId,
                        brand: cartProducts.brand,
                        name: cartProducts.name,
                        price: cartProducts.price,
                        category: cartProducts.category,
                        subCategory: cartProducts.subCategory,
                        colors: cartProducts.colors,
                        description: cartProducts.description,
                        imageUrl: cartProducts.imageUrl,
                        isHotAndNew: cartProducts.isHotAndNew,
                        isTrending: cartProducts.isTrending,
                        isSummerCollection: cartProducts.isSummerCollection,
                        isNewArrival: cartProducts.isNewArrival,
                        isHotSales: cartProducts.isHotSales,
                        isPopularBrand: cartProducts.isPopularBrand,
                        quantity:
                            (int.parse(cartProducts.quantity) + 1).toString(),
                        total: double.parse(cartProducts.price) *
                            (int.parse(cartProducts.quantity) + 1)));
              } else {
                Get.snackbar("LIMIT REACHED", "MAXIMUM 10 QTY ALLOWED");
              }
            })
      ],
    );
  }
}
