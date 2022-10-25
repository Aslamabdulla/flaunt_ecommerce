import 'dart:ui';

import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/glass_tile_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RecentlyViewedWidget extends StatelessWidget {
  const RecentlyViewedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = const [
      Color.fromRGBO(245, 204, 233, .8),
      Color.fromRGBO(211, 245, 245, .8),
      Color.fromRGBO(218, 222, 228, .8),
      Color.fromRGBO(211, 245, 100, .8),
      Color.fromRGBO(219, 206, 230, .8),
      Color.fromRGBO(242, 230, 222, .8),
      Color.fromRGBO(187, 209, 230, .8),
      Color.fromRGBO(125, 220, 213, .8),
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: height * .25,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) => Container(
          height: height * .1,
          width: width / 2.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colors[index],
          ),
          child: Container(
            decoration: glassDecoration,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: -15, sigmaY: -15),
              child: Container(
                padding: const EdgeInsets.all(15),
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
                      height: height * .1,
                      width: width / 2,
                      fit: BoxFit.contain,
                    ),
                    Column(
                      children: const [
                        Text(
                          "Macbook Air M1",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "₹98500",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
