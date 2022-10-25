// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/counter_cart.dart';

class CartListTileWidget extends StatelessWidget {
  final List<String> images;
  const CartListTileWidget({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) => Container(
              decoration: decorationCartTile,
              margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
              width: width,
              height: height / 4.7,
              child: Row(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: decoration,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: height / 5,
                    width: width / 3,
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kHeight5,
                      Text("Women's"),
                      Container(
                        width: width / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Orginal Levis Denim",
                              style: textStyleSize(18, FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      kHeight5,
                      Container(
                        width: width / 2.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Size : 32",
                              style: textStyleSize(16, FontWeight.w500),
                            ),
                            kWidth20,
                            Row(
                              children: [
                                Text(
                                  "Color : ",
                                  style: textStyleSize(16, FontWeight.w500),
                                ),
                                CircleAvatar(
                                  radius: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "₹1500",
                        style: textStyleSize(18, FontWeight.w600),
                      ),
                      kHeight15,
                      Container(
                        width: width / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [CounterCartWidget(), Icon(Icons.close)],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ));
  }
}
