import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flutter/material.dart';

class WalletBalanceWidget extends StatelessWidget {
  const WalletBalanceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15),
          padding: EdgeInsets.all(20),
          decoration: boxGradientDecoration,
          height: height * .14,
          width: width * .7,
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
                "₹145,76",
                style: textStyleSize(28, FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
