// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';

class GlassTileWidget extends StatelessWidget {
  final int index;
  const GlassTileWidget({
    Key? key,
    required this.index,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: glassDecoration,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: -15, sigmaY: -15),
        child: Container(
          padding: const EdgeInsets.all(8),
          height: height * .1,
          width: width / 3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Spacer(),
                  Icon(Icons.favorite_outline_outlined)
                ],
              ),
              Image.asset(
                Accesoriesimages[index],
                height: height * .09,
                width: width / 3,
              ),
              Column(
                children: const [
                  Text("Macbook Air M1"),
                  Text("₹98500"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
