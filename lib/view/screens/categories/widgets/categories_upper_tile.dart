// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/categories/widgets/head_offer_tile.dart';
import 'package:flaunt_ecommenrce/view/screens/categories/widgets/widgets.dart';

class CategoriesUpperTile extends StatelessWidget {
  final List<String> offerTopTileBg;
  const CategoriesUpperTile({
    Key? key,
    required this.offerTopTileBg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 3.2,
      width: width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imagesNoBackgroundWomen.length,
          itemBuilder: (context, index) {
            return HeadTileCategories(
              offerTopTileBg: offerTopTileBg,
              index: index,
            );
          }),
    );
  }
}
