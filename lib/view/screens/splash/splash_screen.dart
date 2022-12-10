import 'package:flaunt_ecommenrce/dependency/shared_pref.dart';
import 'package:flaunt_ecommenrce/view/screens/home_bottom_navigation/home_navigation.dart';
import 'package:flaunt_ecommenrce/view/screens/login/login.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/on_board_control_home.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  bool? firstTime = true;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      firstTime = SharedPref.getLogin();
      splashTimer();
    });

    final height = ScreenUtil().screenHeight;
    final width = ScreenUtil().screenWidth;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: onBoardDecoration,
        child: Center(
          child: Text("FLAUNT", style: textStyleItaliana),
        ),
      ),
    );
  }

  splashTimer() async {
    await Future.delayed(
      const Duration(seconds: 4),
    ).then((value) => Get.offAll(
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 500), () {
          firstTime = SharedPref.getLogin();
          return firstTime == null ? const OnboardFirst() : const LoginPage();
        }));
  }
}
