import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../home_screen/widgets/widgets.dart';

class CategoryTileWidget extends StatelessWidget {
  const CategoryTileWidget({
    Key? key,
    required this.index,
    required this.categoryImage,
    required this.categoryData,
  }) : super(key: key);
  final int index;
  final String categoryImage;
  final List<String> categoryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(categoryImage))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 50,
            width: double.infinity,
            decoration: glassDecorationCustom(
                kWhite.withOpacity(.8), kWhite.withOpacity(.5)),
            child: Center(
              child: Text(
                categoryData[index].toUpperCase(),
                overflow: TextOverflow.clip,
                style: TextStyle(
                    color: kBlack, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
