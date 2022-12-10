import 'dart:ui';

import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/login/login.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/on_boarding_last.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/on_boarding_second.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/first_page.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/second_page.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/third_page.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnboardFirst extends StatelessWidget {
  const OnboardFirst({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    LiquidController liquidController = LiquidController();
    final pages = [
      const FirstPage(),
      const SecondPage(),
      const ThirdPage(),
      const OnBoardingSecondScreen(),
      const OnboardingFinalScreen(),
    ];

    return Scaffold(
        body: LiquidSwipe(
      liquidController: liquidController,
      enableSideReveal: true,
      slideIconWidget: const Icon(Icons.arrow_back_ios_new),
      positionSlideIcon: .8,
      enableLoop: false,
      pages: pages,
      slidePercentCallback: (slidePercentHorizontal, slidePercentVertical) {
        if (index == 4) {
          Get.offAll(() => const LoginPage());
        }
      },
      onPageChangeCallback: (activePageIndex) {
        index = activePageIndex;
      },
    ));
  }
}
