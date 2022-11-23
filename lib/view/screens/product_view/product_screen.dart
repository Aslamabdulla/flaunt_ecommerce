// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flaunt_ecommenrce/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/checkout_page/check_out.dart';
import 'package:flaunt_ecommenrce/view/screens/my_cart/my_cart.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/brand_name_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/carousel_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/cart_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/leading_icon_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/product_color_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/product_description_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/product_image_widget.dart';

import 'widget/stack_decoration.dart';
import 'widget/title_widget_product.dart';

// final formKey = GlobalKey<FormState>();

class ProductViewScreen extends StatelessWidget {
  final int itemIndex;
  final String category;
  final String subCategory;
  final bool isMainCollection;

  final String docId;
  const ProductViewScreen({
    Key? key,
    required this.itemIndex,
    required this.category,
    required this.subCategory,
    required this.isMainCollection,
    required this.docId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const LeadingIconWidget(),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: StreamBuilder<DocumentSnapshot<Object?>>(
            stream: FirebaseDatabase.getItem(
                docId, category, subCategory, isMainCollection),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const CupertinoActivityIndicator();
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("ERROR OCCURED"),
                );
              } else {
                var productInfo = snapshot.data!.data() as Map<String, dynamic>;
                final product = Product.fromSnapshot(snapshot.data!);
                final id = snapshot.data?.id ?? "";

                // String id = snapshot.data!.id;
                // print(id);
                // String subCategory = productInfo['subCategory'];
                // String title = productInfo['name'];
                // String description = productInfo['description'];
                // String price = productInfo['price'];
                // String quantity = productInfo['quantity'];
                // String productId = productInfo['productId'];
                // final List imageUrl = productInfo['imageUrl'];

                // List colors = productInfo['colors'];
                // String category = productInfo['category'];
                // String brandName = productInfo['brand'];

                return Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    CarouselWidget(
                        height: height,
                        width: width,
                        imageUrl: product.imageUrl),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        height: height / 2,
                        width: width,
                        decoration: stackDecoration,
                        child: Column(
                          children: [
                            BrandNameWidget(
                              brandName: product.brand,
                              categoryName: category,
                            ),
                            TitleWidget(
                                width: width,
                                title: product.name,
                                price: product.price),
                            DescriptionWidget(
                                width: width, description: product.description),
                            kHeight5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ColorWidget(),
                                QuantityWidget(
                                    width: width,
                                    height: height,
                                    quantity: product.quantity),
                              ],
                            ),
                            kHeight10,
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: CountAndCartWidget(
                                  isMainCollection: isMainCollection,
                                  id: id!,
                                  category: category,
                                  subCategory: subCategory,
                                  docId: docId,
                                  quantity: int.parse(product.quantity)),
                            ),
                            kHeight15,
                            ElevatedButton.icon(
                                style: buttonStyleCart(width * .8, 50, kBlack),
                                onPressed: () async {
                                  cartController.orderList.clear();
                                  Get.to(
                                      () => MyCartScreen(
                                          totalBill: cartController
                                              .priceCartListenable.value),
                                      transition: Transition.rightToLeft,
                                      duration: Duration(milliseconds: 500));
                                },
                                icon: const Icon(Icons.local_mall),
                                label: const Text(
                                  "CHECKOUT",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ))
                          ],
                        ))
                  ],
                );
              }
            }));
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.category,
  }) : super(key: key);

  final double width;
  final double height;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "CATEGORY : ",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.quantity,
  }) : super(key: key);

  final double width;
  final double height;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * .35,
      height: height * .06,
      decoration: BoxDecoration(
          border: Border.all(width: .5),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "QUANTITY : ",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(quantity)
        ],
      ),
    );
  }
}
