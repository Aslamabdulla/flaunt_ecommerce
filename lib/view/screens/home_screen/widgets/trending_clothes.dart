import 'package:flutter/material.dart';

class TrendingClothesWidget extends StatelessWidget {
  const TrendingClothesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .25,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(left: 10),
          height: height * .2,
          width: width / 2.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
