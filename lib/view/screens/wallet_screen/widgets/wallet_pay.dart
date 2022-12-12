import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletPaytileWidgets extends StatelessWidget {
  const WalletPaytileWidgets({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print(width * .3);
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 150.h,
      width: 150.w,
      decoration: boxGradientDecorFlauntPay,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            kHeight5,
            Icon(
              iconFlauntPay[index],
              size: 40.w,
            ),
            Text(
              textFlauntPay[index],
              style: textStyleSize(18, FontWeight.w500),
            ),
            kHeight5
          ]),
    );
  }
}
