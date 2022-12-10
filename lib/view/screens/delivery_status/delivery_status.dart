// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flaunt_ecommenrce/view/screens/delivery_status/widgets/row_start_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:flaunt_ecommenrce/model/order_model/order_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_bottom_navigation/home_navigation.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/row_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';

import 'widgets/estimated_delivery_widget.dart';

class DeliveryStatusScren extends StatelessWidget {
  final String id;
  final OrderModel orderModel;
  const DeliveryStatusScren({
    Key? key,
    required this.id,
    required this.orderModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil().screenHeight;
    final width = ScreenUtil().screenWidth;
    final date = DateTime.parse(orderModel.date);
    final formattedDate = DateFormat('EEE,M/d/y/hh:mm a').format(date);

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
              height: height / 2.2.h,
              decoration: customClipperBackground,
            ),
          ),
          SafeArea(
            child: Container(
              height: height.h,
              width: width.w,
              padding: const EdgeInsets.symmetric(horizontal: 20).w,
              child: StreamBuilder<Object>(
                  stream: FirebaseDatabase.readorders(),
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        const EstimatedDeliveryWidget(),
                        kHeight10,
                        Row(
                          children: [
                            Text(
                              "Order Placed : $formattedDate",
                              style: textStyleSize(18, FontWeight.bold),
                            )
                          ],
                        ),
                        kHeight15,
                        RowStartTextWidget(
                            orderModel: orderModel, text: "Track Order"),
                        kHeight10,
                        AnotherStepper(
                          dotWidget: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          inActiveBarColor: Colors.grey,
                          activeBarColor: Colors.green,
                          stepperList: stepperData,
                          stepperDirection: Axis.vertical,
                          horizontalStepperHeight: 60.h,
                          inverted: false,
                          activeIndex: int.parse(orderModel.productIndex),
                        ),
                        LoginButtonWidget(
                            name: "Homepage",
                            height: height * .06.h,
                            width: width - 100.w,
                            fnctn: () =>
                                Get.to(() => const HomeNavigationPage()))
                      ],
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
