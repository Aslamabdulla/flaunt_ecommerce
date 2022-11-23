// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';

class GlassTileWidget extends StatelessWidget {
  final int index;
  Map<String, dynamic> products;
  GlassTileWidget({
    Key? key,
    required this.index,
    required this.products,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final productImage = products['imageUrl'];
    var productName = products['name'];
    var productPrice = products['price'];
    return Container(
      decoration: glassDecoration,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: -15, sigmaY: -15),
        child: Container(
          padding: const EdgeInsets.all(8),
          height: height * .1,
          width: width / 3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Spacer(),
                  Icon(Icons.favorite_outline_outlined)
                ],
              ),
              Image.network(
                productImage[3],
                height: height * .09,
                width: width / 3,
              ),
              Column(
                children: [
                  Text(productName, style: textStyleSize(15, FontWeight.bold)),
                  Text("₹$productPrice",
                      style: textStyleSize(18, FontWeight.bold)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
