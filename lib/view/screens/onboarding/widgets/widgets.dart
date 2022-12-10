import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const onBoardDecoration = BoxDecoration(
    image: DecorationImage(
        image: AssetImage(
          "assets/images/onboarding1.png",
        ),
        fit: BoxFit.cover));

final textStyleItaliana =
    TextStyle(fontFamily: 'Italiana', color: kWhite, fontSize: 50.sp);

const onBoardFirstImage = BoxDecoration(
    image: DecorationImage(
        image: AssetImage(
          "assets/images/onboarding4.png",
        ),
        fit: BoxFit.cover));
const onBoardSecondImage = BoxDecoration(
    image: DecorationImage(
        image: AssetImage(
          "assets/images/onboarding8.png",
        ),
        fit: BoxFit.cover));
const onBoardThirdImage = BoxDecoration(
    image: DecorationImage(
        image: AssetImage(
          "assets/images/onboarding6.png",
        ),
        fit: BoxFit.cover));
final onBoardFourthImage = BoxDecoration(
    borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(50).w,
        topRight: const Radius.circular(50).w),
    image: const DecorationImage(
        image: AssetImage(
          "assets/images/onboarding9.png",
        ),
        fit: BoxFit.cover));

final stackDecoration = BoxDecoration(
  color: kWhite,
  borderRadius: BorderRadius.only(
      topLeft: const Radius.circular(50).w,
      topRight: const Radius.circular(50).w),
);
final onBoardFinalImage = BoxDecoration(
    borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(50).w,
        topRight: const Radius.circular(50).w),
    image: const DecorationImage(
        image: AssetImage(
          "assets/images/onboarding10.png",
        ),
        fit: BoxFit.cover));
