import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';

class GridMostpopular extends StatelessWidget {
  const GridMostpopular({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: height * .3,
      child: GridView.count(
        physics: BouncingScrollPhysics(),
        childAspectRatio: .4,
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: List.generate(
          8,
          (index) => Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Colors.grey.shade400,
                    spreadRadius: -5)
              ],
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            height: 200,
            width: width / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: decoration,
                  child: Image.asset(
                    imageShoeCategories[index],
                    fit: BoxFit.contain,
                    height: height * .1,
                    width: width / 3,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Nike Delta 3 SP"), Text("₹2500"), kHeight10],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
