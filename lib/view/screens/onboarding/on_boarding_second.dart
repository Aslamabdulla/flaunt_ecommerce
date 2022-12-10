import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/on_boarding_last.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/rich_text.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnBoardingSecondScreen extends StatelessWidget {
  const OnBoardingSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil().screenHeight;
    final width = ScreenUtil().screenWidth;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              decoration: onBoardFourthImage,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              height: height / 2.4,
              width: width,
              decoration: stackDecoration,
              child: Column(
                children: [
                  const RichTextWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      "BY USING FLAUNT YOU WILL GET CASHBACK\n ON EVERY PURCHASE..."),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(),
                      // CircleAvatar(
                      //   backgroundColor: kBlack,
                      //   radius: 30,
                      //   child: IconButton(
                      //       onPressed: () =>
                      //           Get.to(() => const OnboardingFinalScreen()),
                      //       icon: const Icon(
                      //         Icons.chevron_right,
                      //       )),
                      // )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
