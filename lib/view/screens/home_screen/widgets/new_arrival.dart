import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/model/cart_model/cart_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewWallWidget extends StatelessWidget {
  const NewWallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil().scaleHeight;
    final width = ScreenUtil().screenWidth;
    // print(width * .3);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10).w,
      height: 150.h,
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseDatabase.readHotsales("newarrivals"),
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
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                        width: 10.w,
                      ),
                  itemBuilder: (context, index) {
                    var newProducts = CartModel.fromJson(
                        json: snapshot.data!.docs[index].data());
                    String id = snapshot.data!.docs[index].id;
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25).w,
                          image: const DecorationImage(
                              image: AssetImage(
                                  "assets/images/backgroundnewarrival.png"),
                              fit: BoxFit.cover)),
                      height: 210.h,
                      width: 293.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              kHeight5,
                              Text(
                                "NEW\nARRIVALS",
                                style:
                                    TextStyle(fontSize: 20.sp, color: kWhite),
                              ),
                              Text(
                                "Fashion Nova",
                                style:
                                    TextStyle(fontSize: 10.sp, color: kWhite),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.to(() => ProductViewScreen(
                                      itemIndex: index,
                                      category: "newarrivals",
                                      subCategory: "flaunt",
                                      isMainCollection: false,
                                      docId: id));
                                },
                                child: const Text("Shop Now"),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20).w)),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.purple),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10).r,
                            height: 143.5.h,
                            width: 123.5.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                  image: NetworkImage(newProducts.imageUrl[0]),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }
          }),
    );
  }
}
