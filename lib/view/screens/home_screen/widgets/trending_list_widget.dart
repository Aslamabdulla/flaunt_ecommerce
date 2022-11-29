//
import 'dart:ui';

import 'package:flaunt_ecommenrce/model/cart_model.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingListItemWidget extends StatelessWidget {
  const TrendingListItemWidget({
    Key? key,
    required this.index,
    required this.colors,
    required this.trndingClothes,
  }) : super(key: key);

  final int index;

  final List<Color> colors;
  final CartModel trndingClothes;

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Container(
      height: height * .2,
      width: width / 2.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colors[index],
      ),
      child: Container(
        decoration: glassDecoration,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: -15, sigmaY: -15),
          child: Container(
            padding: const EdgeInsets.all(15),
            height: height * .2,
            width: width / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   mainAxisSize: MainAxisSize.min,
                //   children: const [
                //     Spacer(),
                //     Icon(Icons.favorite_outline_outlined)
                //   ],
                // ),
                Image.network(
                  trndingClothes.imageUrl[3],
                  height: height * .18,
                  width: width / 2,
                  fit: BoxFit.fitHeight,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width * .5,
                      child: Text(
                        trndingClothes.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "₹${trndingClothes.price}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
