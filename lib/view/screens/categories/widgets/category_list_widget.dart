// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/categories/widgets/categories_upper_tile.dart';
import 'package:flaunt_ecommenrce/view/screens/categories/widgets/grid_view_categories.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/row_widget.dart';

class CategoryListWidget extends StatelessWidget {
  CategoryListWidget({
    Key? key,
    required this.category,
    required this.subCategory,
    required this.offerTopTileBg,
    required this.index,
    required this.snapshot,
  }) : super(key: key);

  final String category;
  final String subCategory;
  final List<String> offerTopTileBg;
  final int index;
  AsyncSnapshot<QuerySnapshot<Object?>> snapshot;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          category.toUpperCase(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        kHeight15,
        CategoriesUpperTile(offerTopTileBg: imagesNoBackgroundMen),
        RowWidget(
          text: "FOR $category".toUpperCase(),
          top: 10,
          left: 10,
          fontSize: 18,
          mainAxis: MainAxisAlignment.spaceBetween,
        ),
        kHeight15,
        GridViewCategoryWidget(
          snapshot: snapshot,
          imagesList: gridMenCategories,
        ),
        kHeight15,
      ],
    );
  }
}
