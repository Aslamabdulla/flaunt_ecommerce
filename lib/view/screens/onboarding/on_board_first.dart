import 'dart:ui';

import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/on_boarding_last.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/on_boarding_second.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/first_page.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/second_page.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/third_page.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnboardFirst extends StatelessWidget {
  const OnboardFirst({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    final pages = [
      const FirstPage(),
      const SecondPage(),
      const ThirdPage(),
    ];

    return Scaffold(
        body: LiquidSwipe(
      enableSideReveal: true,
      slideIconWidget: Icon(Icons.arrow_back_ios_new),
      positionSlideIcon: .5,
      enableLoop: false,
      pages: pages,
    ));
  }
}