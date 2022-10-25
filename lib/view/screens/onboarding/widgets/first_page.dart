import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Container(
        height: height,
        width: width,
        decoration: onBoardFirstImage,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "THE LATEST CLOTHES\nOF THE DAY",
                      style: TextStyle(
                          fontSize: 25,
                          color: kWhite,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "A Premium Online Store For Men & Women\nFind Their Stylish Choice",
                      style: TextStyle(fontSize: 12, color: kWhite),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}