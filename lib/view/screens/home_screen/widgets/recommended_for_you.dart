import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/glass_tile_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/product_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecommendedForYou extends StatelessWidget {
  const RecommendedForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseDatabase.readHotsales("recommendedforyou"),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("ERROR OCCURED");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return CupertinoActivityIndicator();
          } else if (snapshot.data == null) {
            return Text("No Item");
          } else {
            return Container(
              margin: const EdgeInsets.only(left: 10).r,
              height: 170.h,
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                        width: 10.w,
                      ),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var product = snapshot.data!.docs[index].data();
                    var docId = snapshot.data!.docs[index].id;
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ProductViewScreen(
                              itemIndex: index,
                              category: "recommendedforyou",
                              subCategory: "flaunt",
                              docId: docId,
                              isMainCollection: false,
                            ));
                      },
                      child: GlassTileWidget(
                        index: index,
                        products: product,
                      ),
                    );
                  }),
            );
          }
        });
  }
}
