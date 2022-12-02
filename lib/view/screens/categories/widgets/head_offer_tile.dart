// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/model/cart_model.dart';
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/screens/categories/widgets/widgets.dart';

class HeadTileCategories extends StatelessWidget {
  final int index;
  final String category;
  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;
  HeadTileCategories({
    Key? key,
    required this.index,
    required this.category,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var upperProducts =
        CartModel.fromJson(json: snapshot.data!.docs[index].data());
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      height: 250,
      width: 200,
      decoration: decorationCategories(upperProducts.imageUrl[3], index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                upperProducts.brand.toUpperCase(),
                style: textStyleSize(16, FontWeight.w400),
              ),
              const Icon(Icons.favorite_outline_outlined)
            ],
          ),
          Text(upperProducts.name, style: textStyleSize(18, FontWeight.w600)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("₹${upperProducts.price}"),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(Icons.arrow_forward_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
