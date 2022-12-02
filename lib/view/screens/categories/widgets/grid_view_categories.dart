// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/model/product_model.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';


class GridViewCategoryWidget extends StatelessWidget {
  AsyncSnapshot<QuerySnapshot<Object?>> snapshot;
  GridViewCategoryWidget({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.custom(
          shrinkWrap: true,
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
              childCount: snapshot.data!.docs.length, (context, index) {
            var productInfo =
                snapshot.data!.docs[index].data() as Map<String, dynamic>;
            String firebaseId = snapshot.data!.docs[index].id;

            String category = productInfo['category'];
            String subCategory = productInfo['subCategory'];

            return image(index, snapshot, productInfo);
          }),
        ));
  }
}

Widget image(
    int index, AsyncSnapshot snapshot, Map<String, dynamic> productInfo) {
  String firebaseId = snapshot.data!.docs[index].id;

  String category = productInfo['category'];
  String subCategory = productInfo['subCategory'];
  String brandName = productInfo['brand'];
  String id = snapshot.data!.docs[index].id;
  String title = productInfo['name'];
  String description = productInfo['description'];
  String price = productInfo['price'];
  String quantity = productInfo['quantity'];
  String productId = productInfo['productId'];
  List imageUrl = productInfo['imageUrl'];
  List colors = productInfo['colors'];
  return GestureDetector(
    onTap: (() {
      Get.to(() => ProductViewScreen(
            isMainCollection: true,
            category: category,
            docId: id,
            itemIndex: index,
            subCategory: subCategory,
          ));
    }),
    child: Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              imageUrl[0],
            ),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(left: 15),
            height: 60,
            decoration: glassDecorationGrid,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width * .36,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: gridstyle,
                      ),
                    ),
                    Text(
                      "₹$price",
                      style: gridstyleSub,
                    ),
                    kHeight5
                  ],
                ),
                // Icon(Icons.favorite_outline_outlined)
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
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
