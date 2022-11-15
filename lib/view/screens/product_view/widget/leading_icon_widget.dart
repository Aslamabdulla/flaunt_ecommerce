import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';

class LeadingIconWidget extends StatelessWidget {
  const LeadingIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/images/noise.png"),
              fit: BoxFit.cover,
              opacity: .07),
          border: Border.all(width: 1, color: Colors.white30),
          shape: BoxShape.circle,
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Colors.white12, Colors.white30])),
      child: const Center(
        child: Icon(
          Icons.chevron_left,
          color: kBlack,
        ),
      ),
    );
  }
}
