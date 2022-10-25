// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final List<String> category;
  final List<String> offerTopTileBg;
  int index;
  CategoriesScreen({
    Key? key,
    required this.category,
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
              child: CategoryListWidget(
                  category: category,
                  offerTopTileBg: offerTopTileBg,
                  index: index),
            ),
          ),
        ],
      ),
    );
  }
}
