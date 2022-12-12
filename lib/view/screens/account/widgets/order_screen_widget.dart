import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/model/order_model/order_model.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/account/widgets/order_tile_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/delivery_status/delivery_status.dart';
import 'package:flaunt_ecommenrce/view/screens/home_bottom_navigation/home_navigation.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderSceenWidget extends StatelessWidget {
  const OrderSceenWidget({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil().screenHeight;

    final width = ScreenUtil().screenWidth;
    return Column(
      children: [
        RowWidget(
          text: "MY ORDERS",
          top: 15,
          left: 15,
          fontSize: 18.sp,
          mainAxis: MainAxisAlignment.spaceBetween,
        ),
        kHeight10,
        ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              loginController.recentOrders =
                  OrderModel.fromMap(snapshot.data!.docs[index].data());
              final id = snapshot.data!.docs[index].id;

              return GestureDetector(
                onTap: () => Get.to(() => DeliveryStatusScren(
                      orderModel: loginController.recentOrders!,
                      id: id,
                    )),
                child: OrderTileWidget(
                  snapshot: snapshot,
                  images: loginController.recentOrders!.imageUrl,
                  index: index,
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
            itemCount: snapshot.data!.docs.length),
        kHeight45,
        kHeight45,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).w,
          child: LoginButtonWidget(
            name: "HOMEPAGE",
            height: height * .06.h,
            width: width.w,
            fnctn: () => Get.offAll(() => const HomeNavigationPage()),
          ),
        ),
        kHeight15,
      ],
    );
  }
}
