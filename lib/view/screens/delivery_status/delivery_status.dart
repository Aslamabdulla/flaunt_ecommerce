import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_bottom_navigation/home_navigation.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/row_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryStatusScren extends StatelessWidget {
  const DeliveryStatusScren({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: Text(
          "DELIVERY STATUS",
          style: textStyleSize(18, FontWeight.w600),
        ),
        centerTitle: true,
        foregroundColor: kBlack,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipperPath(),
            child: Container(
              height: height / 2.2,
              decoration: customClipperBackground,
            ),
          ),
          SafeArea(
            child: Container(
              height: height,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  RowWidget(
                      mainAxis: MainAxisAlignment.center,
                      text: "Estimated Delivery",
                      top: 20,
                      left: 0,
                      fontSize: 16),
                  RowWidget(
                      mainAxis: MainAxisAlignment.center,
                      text: "20 October 2022 5:30 PM",
                      top: 20,
                      left: 0,
                      fontSize: 16),
                  kHeight15,
                  Row(
                    children: [
                      Text(
                        "Track Order",
                        style: textStyleSize(16, FontWeight.w600),
                      ),
                      Spacer(),
                      Text("IN871054C")
                    ],
                  ),
                  kHeight10,
                  AnotherStepper(
                    dotWidget: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    inActiveBarColor: Colors.grey,
                    activeBarColor: Colors.green,
                    stepperList: stepperData,
                    stepperDirection: Axis.vertical,
                    horizontalStepperHeight: 60,
                    inverted: false,
                    activeIndex: 1,
                  ),
                  LoginButtonWidget(
                      name: "Homepage",
                      height: height * .06,
                      width: width - 100,
                      fnctn: () => Get.to(() => HomeNavigationPage()))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
