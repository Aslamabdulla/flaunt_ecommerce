import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: TextStyle(
                fontFamily: 'Oswald',
                fontSize: 35.sp,
                fontWeight: FontWeight.w600,
                color: kBlack),
            children: const [
          TextSpan(
              text: "SHOPPING",
              style: TextStyle(
                color: kLightBlue,
              )),
          TextSpan(text: " IS\nNEVER A BAD IDEA!!"),
        ]));
  }
}
