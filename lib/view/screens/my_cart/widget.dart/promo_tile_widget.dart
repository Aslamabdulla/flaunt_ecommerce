import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/my_cart/widget.dart/promo_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoCodeTileWidget extends StatelessWidget {
  const PromoCodeTileWidget({
    Key? key,
    required this.offerController,
  }) : super(key: key);

  final TextEditingController offerController;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 70.sp,
      decoration: boxGradientDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PromoCodeWidget(width: width, offerController: offerController),
          kWidth10,
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "APPLY",
              style: textStyleSize(15, FontWeight.w500),
            ),
            style: buttonStyleCart(109.w, 45.h, kWhite),
          )
        ],
      ),
    );
  }
}
