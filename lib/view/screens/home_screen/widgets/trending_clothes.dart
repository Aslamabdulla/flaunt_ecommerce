import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/model/cart_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/glass_tile_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/trending_list_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingClothes extends StatelessWidget {
  const TrendingClothes({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = const [
      Color.fromRGBO(211, 245, 245, .8),
      Color.fromRGBO(245, 204, 233, .8),
      Color.fromRGBO(211, 245, 245, .8),
      Color.fromRGBO(218, 222, 228, .8),
      Color.fromRGBO(211, 245, 100, .8),
      Color.fromRGBO(219, 206, 230, .8),
      Color.fromRGBO(242, 230, 222, .8),
      Color.fromRGBO(187, 209, 230, .8),
      Color.fromRGBO(125, 220, 213, .8),
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: height * .3,
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseDatabase.readHotsales("trendingclothes"),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("ERROR WHILE FETCHING DATA");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CupertinoActivityIndicator();
            } else if (snapshot.data == null) {
              return Text("NO DATA");
            } else {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                        width: 10,
                      ),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final trndingClothes = CartModel.fromJson(
                        json: snapshot.data!.docs[index].data());
                    String id = snapshot.data!.docs[index].id;

                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ProductViewScreen(
                              itemIndex: index,
                              category: "trendingclothes",
                              subCategory: "flaunt",
                              docId: id,
                              isMainCollection: false,
                            ));
                      },
                      child: TrendingListItemWidget(
                        colors: colors,
                        trndingClothes: trndingClothes,
                        index: index,
                      ),
                    );
                  });
            }
          }),
    );
  }
}
