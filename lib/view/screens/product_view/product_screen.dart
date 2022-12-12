// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flaunt_ecommenrce/model/product_model/product_model.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/quantity_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final width = ScreenUtil().screenWidth;
    final height = ScreenUtil().screenHeight;

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

                return Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    CarouselWidget(
                        height: height,
                        width: width,
                        imageUrl: product.imageUrl),
                    Container(
                        padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15)
                            .w,
                        height: 422.h,
                        width: width,
                        decoration: stackDecoration,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              kHeight5,
                              BrandNameWidget(
                                brandName: product.brand,
                                categoryName: category,
                              ),
                              kHeight5,
                              TitleWidget(
                                  width: width.w,
                                  title: product.name,
                                  price: product.price),
                              kHeight5,
                              DescriptionWidget(
                                  width: width.w,
                                  description: product.description),
                              kHeight5,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const ColorWidget(),
                                  QuantityWidget(
                                      width: width.w,
                                      height: height.h,
                                      quantity: product.quantity),
                                ],
                              ),
                              kHeight10,
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 12, right: 12)
                                        .r,
                                child: CountAndCartWidget(
                                    isMainCollection: isMainCollection,
                                    id: id,
                                    category: category,
                                    subCategory: subCategory,
                                    docId: docId,
                                    quantity: int.parse(product.quantity)),
                              ),
                              kHeight5,
                              ElevatedButton.icon(
                                  style: buttonStyleCart(300.w, 45.h, kBlack),
                                  onPressed: () async {
                                    cartController.orderList.clear();
                                    Get.to(
                                        () => MyCartScreen(
                                            totalBill: cartController
                                                .priceCartListenable.value),
                                        transition: Transition.rightToLeft,
                                        duration:
                                            const Duration(milliseconds: 500));
                                  },
                                  icon: Icon(
                                    Icons.local_mall,
                                    size: 20.sp,
                                  ),
                                  label: Text(
                                    "CHECKOUT",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp),
                                  ))
                            ],
                          ),
                        ))
                  ],
                );
              }
            }));
  }
}
