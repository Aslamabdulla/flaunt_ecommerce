// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/model/cart_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/hot_and_new/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flaunt_ecommenrce/controller/hot_and_new_controller/hot_and_view_controller.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';

class HotAndNewScreen extends StatelessWidget {
  const HotAndNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<HotAndNewController>(
        init: HotAndNewController(),
        builder: (controller) {
          return Container(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseDatabase.readHotsales("hotandnew"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CupertinoActivityIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error Occured"),
                      );
                    } else if (snapshot.data == null) {
                      return Center(
                        child: Text("No data"),
                      );
                    } else {
                      return PageView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.docs.length,
                          controller: controller.pageviewController,
                          itemBuilder: (context, index) {
                            var hotAndNew = CartModel.fromJson(
                                json: snapshot.data!.docs[index].data());
                            String id = snapshot.data!.docs[index].id;
                            return Container(
                              height: height,
                              width: width,
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
                                      padding: EdgeInsets.only(left: 10),
                                      margin:
                                          EdgeInsets.only(bottom: 40, left: 10),
                                      height: height * .20,
                                      width: width / 1.3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidgetWithSize(
                                            text: textPageview[index],
                                            size: width * .10,
                                            family: 'Oswald',
                                            weight: FontWeight.bold,
                                          ),
                                          TextWidgetWithSize(
                                              text: "NEW ARRIVAL",
                                              size: width * .06,
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
                                      margin: EdgeInsets.only(
                                          bottom: 40, right: 10),
                                      height: height * .2,
                                      width: width * .15,
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
                                            icon: Icon(Icons.shopping_cart),
                                          ),
                                          Icon(Icons.favorite_outline_outlined),
                                          Icon(Icons.add)
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

class TextWidgetWithSize extends StatelessWidget {
  final String text;
  final double size;
  final String family;
  final FontWeight weight;
  const TextWidgetWithSize({
    Key? key,
    required this.text,
    required this.size,
    required this.family,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: family,
          fontSize: size,
          fontWeight: weight,
          color: kBlack),
    );
  }
}
