import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/model/cart_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShippingRowWidget extends StatelessWidget {
  final String leading;

  final double size1;
  final double size2;
  final double left;

  ShippingRowWidget({
    Key? key,
    required this.leading,
    required this.size1,
    required this.size2,
    required this.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: left, right: 50, top: 10),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: textStyleSize(size1, FontWeight.w500),
          ),
          SizedBox(
            height: 25,
            width: 100,
            child: Text(
              "Free",
              textAlign: TextAlign.center,
              style: textStyleSize(size2, FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
