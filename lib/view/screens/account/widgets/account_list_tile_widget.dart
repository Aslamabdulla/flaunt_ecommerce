import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountListTile extends StatelessWidget {
  final String text;
  final IconData leading;
  final IconData trailing;
  final Function() onTap;
  const AccountListTile({
    Key? key,
    required this.text,
    required this.leading,
    required this.trailing,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5).w,
        decoration: BoxDecoration(
            color: kWhite, borderRadius: BorderRadius.circular(20).r),
        width: 260.h,
        height: 46.w,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          kWidth10,
          Icon(
            leading,
            size: 20.sp,
          ),
          Spacer(),
          Text(
            text,
            style: TextStyle(fontSize: 14.sp),
          ),
          Spacer(),
          Icon(trailing, size: 20.sp),
          kWidth10
        ]),
      ),
    );
  }
}
