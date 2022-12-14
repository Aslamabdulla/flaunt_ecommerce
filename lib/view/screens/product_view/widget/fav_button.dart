import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackButtonAppbar extends StatelessWidget {
  const BackButtonAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 10).w,
        height: 45.h,
        width: 45.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              Color.fromRGBO(43, 154, 184, 1),
              Color.fromRGBO(60, 174, 200, .4),
            ])),
        child: Center(
          child: Icon(Icons.favorite),
        ),
      ),
    );
  }
}
