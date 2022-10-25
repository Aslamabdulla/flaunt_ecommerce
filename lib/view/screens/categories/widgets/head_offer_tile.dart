// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/screens/categories/widgets/widgets.dart';

class HeadTileCategories extends StatelessWidget {
  final int index;
  final List<String> offerTopTileBg;
  const HeadTileCategories({
    Key? key,
    required this.index,
    required this.offerTopTileBg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      height: 260,
      width: 200,
      decoration: decorationCategories(offerTopTileBg[index], index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                brandNamesNoBg[index],
                style: textStyleSize(16, FontWeight.w400),
              ),
              const Icon(Icons.favorite_outline_outlined)
            ],
          ),
          Text(quotesCategeries[index],
              style: textStyleSize(18, FontWeight.w600)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(priceCategoryNoBg[index]),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(Icons.arrow_forward_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
