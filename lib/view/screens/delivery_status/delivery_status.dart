// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:flaunt_ecommenrce/model/order_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_bottom_navigation/home_navigation.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/row_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';

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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
              height: height / 2.2,
              decoration: customClipperBackground,
            ),
          ),
          SafeArea(
            child: Container(
              height: height,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: StreamBuilder<Object>(
                  stream: FirebaseDatabase.readorders(),
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        EstimatedDeliveryWidget(),
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
                          activeIndex: int.parse(orderModel.productIndex),
                        ),
                        LoginButtonWidget(
                            name: "Homepage",
                            height: height * .06,
                            width: width - 100,
                            fnctn: () => Get.to(() => HomeNavigationPage()))
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

class RowStartTextWidget extends StatelessWidget {
  final String text;
  const RowStartTextWidget({
    Key? key,
    required this.text,
    required this.orderModel,
  }) : super(key: key);

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: textStyleSize(16, FontWeight.w600),
        ),
        Spacer(),
        Text(orderModel.orderId)
      ],
    );
  }
}

class EstimatedDeliveryWidget extends StatelessWidget {
  const EstimatedDeliveryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RowWidget(
            mainAxis: MainAxisAlignment.center,
            text: "Estimated Delivery : ",
            top: 20,
            left: 0,
            fontSize: 16),
        RowWidget(
            mainAxis: MainAxisAlignment.center,
            text: "7-14 DAYS",
            top: 20,
            left: 0,
            fontSize: 16),
      ],
    );
  }
}
