import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
    required this.width,
    required this.description,
  }) : super(key: key);

  final double width;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Text(
        description,
        style: TextStyle(fontSize: 14.sp),
        maxLines: 4,
      ),
    );
  }
}
