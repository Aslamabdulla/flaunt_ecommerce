// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';

class CounterCartWidget extends StatelessWidget {
  final int quantity;
  const CounterCartWidget({
    Key? key,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartCountButtonWidget(
            icon: Icons.remove,
            fnctn: () => cartController.decreaseQuantity(quantity)),
        kWidth5,
        Obx(() => Text(
              cartController.productCountCart.value.toString(),
              style: TextStyle(fontSize: 18),
            )),
        kWidth5,
        CartCountButtonWidget(
          icon: Icons.add,
          fnctn: () => cartController..increaseQuantity(quantity),
        )
      ],
    );
  }
}

class CartCountButtonWidget extends StatelessWidget {
  final IconData icon;
  Function() fnctn;
  CartCountButtonWidget({
    Key? key,
    required this.icon,
    required this.fnctn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fnctn,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color.fromRGBO(43, 154, 184, 1))),
        height: Get.height * .04,
        width: Get.width * .08,
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
  }
}
