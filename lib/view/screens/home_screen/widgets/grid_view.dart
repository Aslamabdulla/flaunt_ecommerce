// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/model/cart_model/cart_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';

class GridViewWidget extends StatelessWidget {
  final List<String> imagesList;
  const GridViewWidget({
    Key? key,
    required this.imagesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil().screenHeight;
    final width = ScreenUtil().screenWidth;
    return Container(
        height: imagesList.length >= 6 ? height.h : height + 300,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseDatabase.readHotsales("summercollection"),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("ERROR WHILE FETCHING DATA");
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return CupertinoActivityIndicator();
              } else if (snapshot.data == null) {
                return Text("NO DATA");
              } else {
                return GridView.custom(
                  physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 5,
                    pattern: [
                      const WovenGridTile(1),
                      const WovenGridTile(
                        5 / 7,
                        crossAxisRatio: 1,
                        alignment: AlignmentDirectional.centerEnd,
                      ),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                      addSemanticIndexes: false,
                      childCount: imagesList.length, (context, index) {
                    var summerCollectionProducts = CartModel.fromJson(
                        json: snapshot.data!.docs[index].data());
                    String id = snapshot.data!.docs[index].id;
                    return image(index, summerCollectionProducts, id);
                  }),
                );
              }
            }));
  }
}

Widget image(int index, CartModel productList, String id) => GestureDetector(
      onTap: (() {
        Get.to(() => ProductViewScreen(
              itemIndex: index,
              docId: id,
              category: "summercollection",
              isMainCollection: false,
              subCategory: "flaunt",
            ));
      }),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(productList.imageUrl[0]), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20).w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              width: 200.w,
              height: 60.h,
              decoration: glassDecorationGrid,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productList.name,
                        style: gridstyle,
                      ),
                      Text(
                        "₹${productList.price}",
                        style: gridstyleSub,
                      ),
                      kHeight5
                    ],
                  ),
                  // StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  //     stream: FirebaseDatabase.readFav(),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.connectionState ==
                  //           ConnectionState.waiting) {
                  //         return SizedBox();
                  //       } else if (snapshot.hasError) {
                  //         return SizedBox();
                  //       } else {
                  //         var fav = snapshot.data!.docs.map((e) => e).toList();

                  //         return fav.contains(productList.productId)
                  //             ? Icon(Icons.favorite_outline_outlined)
                  //             : Icon(
                  //                 Icons.favorite,
                  //                 color: kRedAccent,
                  //               );
                  //       }
                  //     })
                ],
              ),
            ),
          ],
        ),
      ),
    );

//  Stack(
//               children: [
//                 Container(
//                   height: height * .3,
//                   width: width / 2,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage("assets/images/onboarding7.png"),
//                         fit: BoxFit.cover),
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.red,
//                   ),
//                 ),
//                 Positioned(bottom: -10, child: Text("data"))
//               ],
//             )
