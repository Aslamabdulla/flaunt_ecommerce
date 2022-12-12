import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletBalanceWidget extends StatelessWidget {
  const WalletBalanceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print(width * .7);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15).r,
          padding: EdgeInsets.all(20).r,
          decoration: boxGradientDecoration,
          height: 132.h,
          width: 268.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Wallet Balance",
                    style: textStyleSize(16, FontWeight.w500),
                  ),
                  Spacer(),
                  Icon(Icons.wallet)
                ],
              ),
              Text(
                "₹0.0",
                style: textStyleSize(28, FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
