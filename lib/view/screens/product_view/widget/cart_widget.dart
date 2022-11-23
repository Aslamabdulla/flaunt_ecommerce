// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/counter_cart.dart';

class CountAndCartWidget extends StatelessWidget {
  final int quantity;
  final String category;
  final String subCategory;
  final String docId;
  final String id;
  final bool isMainCollection;
  const CountAndCartWidget({
    Key? key,
    required this.quantity,
    required this.category,
    required this.subCategory,
    required this.docId,
    required this.id,
    required this.isMainCollection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CounterCartWidget(quantity: quantity),
        ElevatedButton.icon(
            style: buttonStyleCart(
                width * .5, 50, const Color.fromRGBO(43, 154, 184, 1)),
            onPressed: () async {
              await cartController.checkCartItem(
                  docId, category, subCategory, id, isMainCollection);
            },
            icon: const Icon(Icons.add_shopping_cart_outlined),
            label: const Text("Add to Cart"))
      ],
    );
  }
}
