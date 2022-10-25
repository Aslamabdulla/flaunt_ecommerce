import 'package:flaunt_ecommenrce/view/screens/onboarding/on_board_first.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      splashTimer();
    });
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: onBoardDecoration,
        child: const Center(
          child: Text("FLAUNT", style: textStyleItaliana),
        ),
      ),
    );
  }

  splashTimer() async {
    await Future.delayed(
      const Duration(seconds: 4),
    ).then((value) => Get.to(() => const OnboardFirst()));
  }
}
