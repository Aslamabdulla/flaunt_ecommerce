// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/screens/checkout_page/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentButtonWidget extends StatelessWidget {
  final int index;
  const PaymentButtonWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil().scaleHeight;
    final width = ScreenUtil().screenWidth;
    return Container(
      padding: EdgeInsets.all(8),
      height: height * .07.h,
      width: width * .3.w,
      decoration: boxDecorationPaymentBtn,
      child: Center(
          child: Image.asset(
        paymentButtonImage[index],
        fit: BoxFit.contain,
      )),
    );
  }
}
