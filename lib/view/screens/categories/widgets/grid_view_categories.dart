// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/product_view.dart';

class GridViewCategoryWidget extends StatelessWidget {
  final List<String> imagesList;
  const GridViewCategoryWidget({
    Key? key,
    required this.imagesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.custom(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 5,
            pattern: [
              const WovenGridTile(1),
              const WovenGridTile(
                5 / 7,
                crossAxisRatio: 1,
                alignment: AlignmentDirectional.centerEnd,
              ),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            addSemanticIndexes: false,
            childCount: imagesList.length,
            (context, index) => image(index, imagesList),
          ),
        ));
  }
}

Widget image(int index, List<String> imagesList) => GestureDetector(
      onTap: (() {
        Get.to(() => ProduductView());
      }),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imagesList[index]), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              width: 200,
              height: 60,
              decoration: glassDecorationGrid,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Levis Women Tshirt",
                        style: gridstyle,
                      ),
                      Text(
                        "₹1850",
                        style: gridstyleSub,
                      ),
                      kHeight5
                    ],
                  ),
                  Icon(Icons.favorite_outline_outlined)
                ],
              ),
            ),
          ],
        ),
      ),
    );

//  Stack(
//               children: [
//                 Container(
//                   height: height * .3,
//                   width: width / 2,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage("assets/images/onboarding7.png"),
//                         fit: BoxFit.cover),
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.red,
//                   ),
//                 ),
//                 Positioned(bottom: -10, child: Text("data"))
//               ],
//             )
