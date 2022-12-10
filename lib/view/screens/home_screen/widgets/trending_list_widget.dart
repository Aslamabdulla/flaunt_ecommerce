//
import 'dart:ui';

import 'package:flaunt_ecommenrce/model/cart_model/cart_model.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final height = ScreenUtil().screenHeight;
    final width = ScreenUtil().screenWidth;
    print(width * .5);
    return Container(
      height: 160.h,
      width: 180.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colors[index],
      ),
      child: Container(
        decoration: glassDecoration,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: -15, sigmaY: -15),
          child: Container(
            padding: const EdgeInsets.all(15).w,
            height: 168.h,
            width: 137.w,
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
                  height: 151.h,
                  width: 205.w,
                  fit: BoxFit.fitHeight,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 205.w,
                      child: Text(
                        trndingClothes.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "₹${trndingClothes.price}",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w500),
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
