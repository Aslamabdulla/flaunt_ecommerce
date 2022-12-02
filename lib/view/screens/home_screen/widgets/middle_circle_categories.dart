import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/screens/categories/categories.dart';
import 'package:flaunt_ecommenrce/view/screens/categories/sub_categories.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CircleCategories extends StatelessWidget {
  CircleCategories({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseDatabase.reaCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error Occured"),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (snapshot.data == null) {
            return const Center(
              child: Text("No Data Found"),
            );
          } else {
            final categoryItemsList =
                snapshot.data!.docs.map((e) => e.id).toList();
            print(height * .14);
            return Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10).r,
              height: 105.h,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryItemsList.length,
                  itemBuilder: (context, index) {
                    final categoryData = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;
                    String categoryImage = categoryData['imageUrl'];
                    return GestureDetector(
                      onTap: () => Get.to(() => SubCategoriesScreen(
                          category: categoryItemsList[index])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10).r,
                            height: 80.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(categoryImage),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            categoryItemsList[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14.sp),
                          )
                        ],
                      ),
                    );
                  }),
            );
          }
        });
  }
}
