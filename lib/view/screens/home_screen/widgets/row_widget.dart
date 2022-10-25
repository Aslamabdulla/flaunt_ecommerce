// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  final MainAxisAlignment mainAxis;
  final String text;
  final double top;
  final double left;
  final double fontSize;
  const RowWidget({
    Key? key,
    required this.mainAxis,
    required this.text,
    required this.top,
    required this.left,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top, left: left),
      height: 30,
      child: Row(
        mainAxisAlignment: mainAxis,
        children: [
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize),
          ),
          SizedBox(),
        ],
      ),
    );
  }
}
