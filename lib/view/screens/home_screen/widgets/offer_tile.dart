// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferTile extends StatelessWidget {
  final String image;
  const OfferTile({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 412.w,
      height: 202.h,
      child: Image.asset(
        image,
        fit: BoxFit.contain,
      ),
    );
  }
}
