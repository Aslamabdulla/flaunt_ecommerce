// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flaunt_ecommenrce/model/cart_model/cart_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';

class GridMostpopular extends StatelessWidget {
  const GridMostpopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10).r,
      height: 330.h,
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseDatabase.readHotsales("mostpopular"),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("ERROR WHILE FETCHING DATA");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CupertinoActivityIndicator();
            } else if (snapshot.data == null) {
              return Text("NO DATA");
            } else {
              return GridView.count(
                childAspectRatio: .5,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: List.generate(snapshot.data!.docs.length, (index) {
                  final mostPopularProducts = CartModel.fromJson(
                      json: snapshot.data!.docs[index].data());

                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ProductViewScreen(
                          itemIndex: index,
                          category: mostPopularProducts.category,
                          subCategory: mostPopularProducts.subCategory,
                          isMainCollection: false,
                          docId: mostPopularProducts.productId));
                    },
                    child: MostPopularWidget(
                      product: mostPopularProducts,
                      index: index,
                    ),
                  );
                }),
              );
            }
          }),
    );
  }
}

class MostPopularWidget extends StatelessWidget {
  final int index;
  final CartModel product;
  MostPopularWidget({
    Key? key,
    required this.index,
    required this.product,
  }) : super(key: key);

  final double width = Get.width;
  final double height = Get.height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: width,
      padding: EdgeInsets.all(15).w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 10, color: Colors.grey.shade400, spreadRadius: -5)
        ],
        borderRadius: BorderRadius.circular(20).w,
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: decoration,
            child: Image.network(
              product.imageUrl[1],
              fit: BoxFit.cover,
              height: height * .2,
              width: width * .25,
            ),
          ),
          kWidth10,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 140.w,
                  child: Text(
                    product.name,
                    style: textStyleSize(15, FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  )),
              kHeight5,
              Text(
                product.brand,
                style: textStyleSize(16, FontWeight.bold),
              ),
              kHeight5,
              Text(
                "₹${product.price}",
                style: textStyleSize(18, FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
