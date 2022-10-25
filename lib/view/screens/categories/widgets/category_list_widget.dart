// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/categories/widgets/categories_upper_tile.dart';
import 'package:flaunt_ecommenrce/view/screens/categories/widgets/grid_view_categories.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/row_widget.dart';

class CategoryListWidget extends StatelessWidget {
  CategoryListWidget({
    Key? key,
    required this.category,
    required this.offerTopTileBg,
    required this.index,
  }) : super(key: key);

  final List<String> category;
  final List<String> offerTopTileBg;
  int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "CATEGORIES",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        kHeight15,
        CategoriesUpperTile(offerTopTileBg: offerTopTileBg),
        RowWidget(
          text: categoriesName[index],
          top: 10,
          left: 10,
          fontSize: 18,
          mainAxis: MainAxisAlignment.spaceBetween,
        ),
        kHeight15,
        GridViewCategoryWidget(
          imagesList: category,
        ),
        kHeight15,
      ],
    );
  }
}
