import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorWidget extends StatelessWidget {
  const ColorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80.w,
            decoration: BoxDecoration(
                border: Border.all(width: .5),
                borderRadius: BorderRadius.circular(20).w),
            child: Center(
              child: Text(
                "COLORS",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
              ),
            ),
          ),
          kHeight10,
          Row(
            children: List.generate(
                4,
                (index) => Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: colorsProduct[index],
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
