// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/categories/widgets/categories_upper_tile.dart';
import 'package:flaunt_ecommenrce/view/screens/categories/widgets/grid_view_categories.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/animated_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/grid_view.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/row_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';

import 'widgets/category_list_widget.dart';

class CategoriesScreen extends StatelessWidget {
  final String category;
  final String subCategory;
  final List<String> offerTopTileBg;
  int index;
  CategoriesScreen({
    Key? key,
    required this.category,
    required this.subCategory,
    required this.offerTopTileBg,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.mic),
          )
        ],
        title: AnimatedSearchWidget(
            width: width, textEditingController: textEditingController),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ClipPath(
            clipper: ClipperPath(),
            child: Container(
              height: height / 1.7,
              decoration: customClipperBackground,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseDatabase.readproducts(category, subCategory),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("ERROR OCCURED"),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    } else if (snapshot.data == null) {
                      return const Center(
                        child: Text("NO ITEM"),
                      );
                    } else if (snapshot.hasData) {
                      return CategoryListWidget(
                          snapshot: snapshot,
                          subCategory: subCategory,
                          category: category,
                          offerTopTileBg: offerTopTileBg,
                          index: index);
                    }
                    return const Center(child: CupertinoActivityIndicator());
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
