import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flutter/material.dart';

class TextWidgetCenter extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  const TextWidgetCenter({
    Key? key,
    required this.text,
    required this.size,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: textStyleSize(size, fontWeight),
        ),
      ],
    );
  }
}
