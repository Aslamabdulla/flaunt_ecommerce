// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/counter_cart.dart';
import 'package:get/get.dart';

class CartListTileWidget extends StatelessWidget {
  final List images;
  final int index;
  AsyncSnapshot<QuerySnapshot<Object?>> snapshot;
  CartListTileWidget({
    Key? key,
    required this.images,
    required this.index,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartProducts =
        snapshot.data!.docs[index].data() as Map<String, dynamic>;
    var id = snapshot.data!.docs[index].id;
    print(id);
    final String category = cartProducts["category"];
    final List imageUrl = cartProducts['imageUrl'];
    final String price = cartProducts["price"];
    final String quantity = cartProducts["quantity"];
    final List color = cartProducts["colors"];
    final String name = cartProducts['name'];
    final String brand = cartProducts['brand'];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: decoration,
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: height / 5,
          width: width / 3,
          child: Image.network(
            imageUrl[0],
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeight5,
            Container(
              width: width / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(brand.toUpperCase()),
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
            ),
            Container(
              width: width / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: textStyleSize(18, FontWeight.w600),
                  ),
                ],
              ),
            ),
            kHeight5,
            Container(
              width: width / 2.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    brand,
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
                  "₹$price",
                  style: textStyleSize(18, FontWeight.w600),
                ),
                kWidth20,
                Text(
                  "Qty : $quantity",
                  style: textStyleSize(18, FontWeight.w600),
                ),
              ],
            ),
            kHeight15,
          ],
        )
      ],
    );
  }
}
