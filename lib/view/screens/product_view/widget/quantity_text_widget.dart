import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.quantity,
  }) : super(key: key);

  final double width;
  final double height;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125.w,
      height: 40.h,
      decoration: BoxDecoration(
          border: Border.all(width: .5),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "QUANTITY : ",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13.sp),
          ),
          Text(
            quantity,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp),
          )
        ],
      ),
    );
  }
}
