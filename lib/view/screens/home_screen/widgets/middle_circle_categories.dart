import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/screens/categories/categories.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleCategories extends StatelessWidget {
  CircleCategories({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: height * .14,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: categoriesName.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Get.to(() => CategoriesScreen(
                offerTopTileBg: categoryTopOffer[index],
                category: categoriesList[index],
                index: index,
              )),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(circleImages[index]),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                categories[index],
                style: TextStyle(fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<String> categories = [
    "Men's T-shirt",
    "Women's T-shirt",
    "Men's Jacket",
    "Long Sleve",
    "Trending",
    "Accessories",
  ];
}
