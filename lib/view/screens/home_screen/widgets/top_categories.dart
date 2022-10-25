import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(left: 10),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageTopCategories[index]),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
              child: Text(
            "${20 + index * 2}%\nOff",
            style: TextStyle(
                fontSize: 20, color: kWhite, fontWeight: FontWeight.w600),
          )),
        ),
      ),
    );
  }
}
