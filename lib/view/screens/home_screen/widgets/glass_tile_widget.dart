// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flaunt_ecommenrce/model/cart_model.dart';
import 'package:flaunt_ecommenrce/model/order_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    var id = products['productId'];

    return Container(
      decoration: glassDecoration,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: -15, sigmaY: -15),
        child: Container(
          padding: const EdgeInsets.all(8).w,
          width: 150.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Spacer(),
              //     GestureDetector(
              //         onTap: () {
              //           FirebaseDatabase.addtoFavourite(products, id);
              //         },
              //         child: favProduct == null
              //             ? Icon(Icons.favorite_outline_outlined)
              //             : Icon(Icons.featured_video_sharp))
              //   ],
              // ),
              Image.network(
                productImage[3],
                height: 76.h,
                width: 138.w,
              ),
              Column(
                children: [
                  Text(productName,
                      style: textStyleSize(15.sp, FontWeight.bold)),
                  Text("₹$productPrice",
                      style: textStyleSize(17.sp, FontWeight.bold)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
