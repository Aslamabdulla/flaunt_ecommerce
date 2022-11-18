// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/model/product.dart';
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/counter_cart.dart';
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
        ProductModel.fromJson(json: snapshot.data!.docs[index].data());
    // var cartProducts =
    //     snapshot.data!.docs[index].data() as Map<String, dynamic>;
    var id = snapshot.data!.docs[index].id;
    print(id);
    // final String category = cartProducts["category"];
    // final List imageUrl = cartProducts['imageUrl'];
    // final String price = cartProducts["price"];
    // final String quantity = cartProducts["quantity"];
    // final List color = cartProducts["colors"];
    // final String name = cartProducts['name'];
    // final String brand = cartProducts['brand'];
    final height = Get.height;
    final width = Get.width;
    cartController.priceCartListenable.value =
        cartProducts.total! + cartController.priceCartListenable.value;
    print(cartController.priceCartListenable.value);
    return Row(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: decoration,
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: height / 5,
          width: width / 3,
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
              width: width / 2,
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
              width: width / 2.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cartProducts.category,
                    style: textStyleSize(16, FontWeight.w500),
                  ),
                  kWidth20,
                  Row(
                    children: [
                      Text(
                        "Color : ",
                        style: textStyleSize(16, FontWeight.w500),
                      ),
                      CircleAvatar(
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
                Text(
                  "Qty : ${cartProducts.quantity}",
                  style: textStyleSize(14, FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              width: width / 2,
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
                              Get.back();
                            },
                            title: "CONFIRM",
                            content: Container(
                              child: Text("DO YOU WANT TO REMOVE"),
                            ));
                      },
                      icon: Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.red,
                      ))
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
