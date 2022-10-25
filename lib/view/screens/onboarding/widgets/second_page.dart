import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Container(
      height: height,
      width: width,
      decoration: onBoardSecondImage,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "CASH BACK ON\nEVERY PURCHASE",
                style: TextStyle(
                    fontSize: 25, color: kBlack, fontWeight: FontWeight.w600),
              ),
              Text(
                "A Premium Online Store For Men & Women\nFind Their Stylish Choice",
                style: TextStyle(fontSize: 12, color: kBlack),
              )
            ],
          ),
        ),
      ),
    );
  }
}
