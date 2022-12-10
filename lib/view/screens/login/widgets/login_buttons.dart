import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginMethodButtons extends StatelessWidget {
  const LoginMethodButtons(
      {Key? key, required this.text, required this.icon, required this.color})
      : super(key: key);
  final text;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      margin: const EdgeInsets.symmetric(horizontal: 85).w,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(241, 246, 251, 1),
          borderRadius: BorderRadius.circular(10).r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            color: color,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 14.sp),
          )
        ],
      ),
    );
  }
}
