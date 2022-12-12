import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountOffers extends StatelessWidget {
  const DiscountOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
      ).r,
      height: 160.h,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(
          height: 10.h,
          width: 10.w,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.only(left: 20, top: 15).r,
          height: 76.h,
          width: 294.w,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(offerCategories[index]), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20).w,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Get up to 30% off\nUsing Flaunt Pay",
              style: TextStyle(
                  fontSize: 22.sp, color: kWhite, fontWeight: FontWeight.w500),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Shop now",
                  style: TextStyle(color: kBlack),
                ),
                style: buttonStyleoffer)
          ]),
        ),
      ),
    );
  }
}
