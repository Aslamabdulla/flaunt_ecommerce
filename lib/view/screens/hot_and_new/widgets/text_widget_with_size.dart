import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';

class TextWidgetWithSize extends StatelessWidget {
  final String text;
  final double size;
  final String family;
  final FontWeight weight;
  const TextWidgetWithSize({
    Key? key,
    required this.text,
    required this.size,
    required this.family,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: family,
          fontSize: size,
          fontWeight: weight,
          color: kBlack),
    );
  }
}
