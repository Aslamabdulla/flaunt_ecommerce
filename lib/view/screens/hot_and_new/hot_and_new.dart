// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/model/cart_model/cart_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/hot_and_new/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flaunt_ecommenrce/controller/hot_and_new_controller/hot_and_view_controller.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';

import 'widgets/text_widget_with_size.dart';

class HotAndNewScreen extends StatelessWidget {
  const HotAndNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil().screenHeight;
    final width = ScreenUtil().screenWidth;
    return GetBuilder<HotAndNewController>(
        init: HotAndNewController(),
        builder: (controller) {
          return Container(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseDatabase.readHotsales("hotandnew"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("Error Occured"),
                      );
                    } else if (snapshot.data == null) {
                      return const Center(
                        child: Text("No data"),
                      );
                    } else {
                      return PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.docs.length,
                          controller: controller.pageviewController,
                          itemBuilder: (context, index) {
                            var hotAndNew = CartModel.fromJson(
                                json: snapshot.data!.docs[index].data());
                            String id = snapshot.data!.docs[index].id;
                            return Container(
                              height: ScreenUtil().screenHeight.h,
                              width: ScreenUtil().scaleWidth.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(hotAndNew.imageUrl[0]),
                                      fit: BoxFit.cover)),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      decoration: glassDecoration,
                                      padding:
                                          const EdgeInsets.only(left: 10).r,
                                      margin: const EdgeInsets.only(
                                              bottom: 40, left: 10)
                                          .r,
                                      height: height * .20.h,
                                      width: width / 1.3.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidgetWithSize(
                                            text: hotAndNew.name,
                                            size: width * .10.w,
                                            family: 'Oswald',
                                            weight: FontWeight.bold,
                                          ),
                                          TextWidgetWithSize(
                                              text: "NEW ARRIVAL",
                                              size: width * .06.w,
                                              family: 'Italiana',
                                              weight: FontWeight.bold)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      decoration: glassDecoration,
                                      margin: const EdgeInsets.only(
                                          bottom: 40, right: 10),
                                      height: height * .2.h,
                                      width: width * .15.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Get.to(() => ProductViewScreen(
                                                  itemIndex: index,
                                                  category: "hotandnew",
                                                  subCategory: "flaunt",
                                                  isMainCollection: false,
                                                  docId: id));
                                            },
                                            icon:
                                                const Icon(Icons.shopping_cart),
                                          ),
                                          const Icon(
                                              Icons.favorite_outline_outlined),
                                          const Icon(Icons.add)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    }
                  }));
        });
  }
}
