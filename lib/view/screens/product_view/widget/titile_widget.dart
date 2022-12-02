import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.width,
    required this.title,
    required this.price,
  }) : super(key: key);

  final double width;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8).r,
      child: TitleWidget(width: width, title: title, price: price),
    );
  }
}
