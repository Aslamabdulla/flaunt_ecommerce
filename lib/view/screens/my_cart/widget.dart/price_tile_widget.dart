import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flutter/material.dart';

class TotalPriceRowWidget extends StatelessWidget {
  final String leading;
  String trailing;
  final double size1;
  final double size2;
  final double left;

  TotalPriceRowWidget({
    Key? key,
    required this.leading,
    required this.trailing,
    required this.size1,
    required this.size2,
    required this.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: left, right: 50, top: 10),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: textStyleSize(size1, FontWeight.w500),
          ),
          SizedBox(
            height: 25,
            width: 100,
            child: Text(
              "₹${trailing.toString()}",
              textAlign: TextAlign.center,
              style: textStyleSize(size2, FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
