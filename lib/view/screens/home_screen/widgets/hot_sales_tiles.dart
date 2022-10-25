import 'dart:ui';

import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/glass_tile_widget.dart';

import 'package:flutter/material.dart';

class HotSalesTiles extends StatelessWidget {
  const HotSalesTiles({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: height * .22,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) =>
            GlassTileWidget(height: height, width: width, index: index),
      ),
    );
  }
}
