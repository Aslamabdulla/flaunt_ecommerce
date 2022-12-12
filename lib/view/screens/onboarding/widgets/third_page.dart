import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/on_boarding_second.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil().screenHeight;
    final width = ScreenUtil().screenWidth;
    return Container(
        height: height,
        width: width,
        decoration: onBoardThirdImage,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30).w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "IT'S A NEW ERA\nIN FASHION",
                          style: TextStyle(
                              fontSize: 25.sp,
                              color: kBlack,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "A Premium Online Store For Men & Women\nFind Their Stylish Choice",
                          style: TextStyle(fontSize: 12.sp, color: kBlack),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
