import 'package:flaunt_ecommenrce/model/order_model/order_model.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flutter/material.dart';

class RowStartTextWidget extends StatelessWidget {
  final String text;
  const RowStartTextWidget({
    Key? key,
    required this.text,
    required this.orderModel,
  }) : super(key: key);

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: textStyleSize(16, FontWeight.w600),
        ),
        Spacer(),
        Text(orderModel.orderId)
      ],
    );
  }
}
