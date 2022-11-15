import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/categories/categories.dart';
import 'package:flaunt_ecommenrce/view/screens/categories/widgets/category_list._tile_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  final String category;
  const SubCategoriesScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "SUB CATEGORIES",
          style: TextStyle(color: kBlack, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipperPath(),
            child: Container(
              height: height / 5,
              decoration: customClipperBackground,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseDatabase.readSubCategories(category),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return Center(child: CupertinoActivityIndicator());
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CupertinoActivityIndicator());
                          } else {
                            final subCategoryData =
                                snapshot.data!.docs.map((e) => e.id).toList();

                            return GridView.custom(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate: SliverWovenGridDelegate.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 0,
                                crossAxisSpacing: 10,
                                pattern: [
                                  const WovenGridTile(1),
                                  const WovenGridTile(
                                    6 / 8,
                                    crossAxisRatio: 1,
                                  ),
                                ],
                              ),
                              childrenDelegate: SliverChildBuilderDelegate(
                                addSemanticIndexes: false,
                                childCount: snapshot.data!.docs.length,
                                (context, index) {
                                  final subCategory = snapshot.data!.docs[index]
                                      .data() as Map<String, dynamic>;
                                  String categoryImage =
                                      subCategory["imageUrl"];
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(() => CategoriesScreen(
                                            category: category,
                                            offerTopTileBg: offerCategories,
                                            index: index,
                                            subCategory: subCategoryData[index],
                                          ));
                                    },
                                    child: CategoryTileWidget(
                                        index: index,
                                        categoryImage: categoryImage,
                                        categoryData: subCategoryData),
                                  );
                                },
                              ),
                            );
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
