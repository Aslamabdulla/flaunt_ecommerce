// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/leading_icon_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'widget/stack_decoration.dart';
import 'widget/title_widget_product.dart';

// final formKey = GlobalKey<FormState>();

class ProductViewScreen extends StatelessWidget {
  final int itemIndex;
  final String category;
  final String subCategory;

  final String docId;
  const ProductViewScreen({
    Key? key,
    required this.itemIndex,
    required this.category,
    required this.subCategory,
    required this.docId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const LeadingIconWidget(),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: StreamBuilder<DocumentSnapshot<Object?>>(
            stream: FirebaseDatabase.getItem(docId, category, subCategory),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return CupertinoActivityIndicator();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("ERROR OCCURED"),
                );
              } else {
                var productInfo = snapshot.data!.data() as Map<String, dynamic>;

                String subCategory = productInfo['subCategory'];
                String title = productInfo['name'];
                String description = productInfo['description'];
                String price = productInfo['price'];
                String quantity = productInfo['quantity'];
                String productId = productInfo['productId'];
                final List imageUrl = productInfo['imageUrl'];

                List colors = productInfo['colors'];
                String category = productInfo['category'];
                String brandName = productInfo['brand'];

                return Container(
                  height: height,
                  width: width,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: const EdgeInsets.only(top: 30),
                          height: height / 2,
                          width: width,
                          child: CarouselSlider.builder(
                            unlimitedMode: true,
                            slideTransform: const CubeTransform(),
                            slideIndicator: CircularSlideIndicator(
                                padding: const EdgeInsets.only(bottom: 40)),
                            slideBuilder: (index) {
                              return Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        alignment: Alignment.topCenter,
                                        image: NetworkImage(imageUrl[index]),
                                        fit: BoxFit.cover)),
                              );
                            },
                            itemCount: 2,
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          height: height / 2,
                          width: width,
                          decoration: stackDecoration,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(brandName,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.edit,
                                          color: kRedAccent,
                                          size: 20,
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: TitleWidget(
                                    width: width, title: title, price: price),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                width: width,
                                child: Text(
                                  description,
                                  maxLines: 5,
                                ),
                              ),
                              kHeight5,
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(width: .5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: const Center(
                                        child: Text(
                                          "COLORS",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    kHeight10,
                                    Row(
                                      children: List.generate(
                                          4,
                                          (index) => Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      colorsProduct[index],
                                                ),
                                              )),
                                    ),
                                  ],
                                ),
                              ),
                              kHeight10,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: width * .45,
                                    height: height * .06,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: .5),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "CATEGORY : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(category.toUpperCase())
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: width * .45,
                                    height: height * .06,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: .5),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "QUANTITY : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(quantity.toString())
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                );
              }
            }));
  }
}
