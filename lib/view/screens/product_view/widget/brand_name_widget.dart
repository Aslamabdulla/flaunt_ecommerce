// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BrandNameWidget extends StatelessWidget {
  const BrandNameWidget({
    Key? key,
    required this.brandName,
    required this.categoryName,
  }) : super(key: key);

  final String brandName;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Container(
        width: Get.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(brandName.toUpperCase(),
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
            RichText(
                text: TextSpan(
                    text: 'CATEGORY : ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: 'Oswald'),
                    children: [
                  TextSpan(
                      text: categoryName.toUpperCase(),
                      style: TextStyle(
                          color: const Color.fromRGBO(43, 154, 184, 1),
                          fontFamily: "Oswald",
                          fontWeight: FontWeight.bold)),
                ]))
            // Text("CATEGORY ${categoryName.toUpperCase()}")
          ],
        ),
      ),
    );
  }
}
