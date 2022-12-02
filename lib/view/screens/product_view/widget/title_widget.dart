import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Mens Denim Jeans",
            style: TextStyle(
              fontSize: 25.sp,
              color: Color.fromRGBO(76, 163, 184, 1),
            ),
          ),
          Text(
            "₹950",
            style: TextStyle(fontSize: 20.sp),
          )
        ],
      ),
    );
  }
}
