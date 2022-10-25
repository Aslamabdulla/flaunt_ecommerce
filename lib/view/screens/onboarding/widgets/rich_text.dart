import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: const TextSpan(
            style: TextStyle(
                fontFamily: 'Oswald',
                fontSize: 35,
                fontWeight: FontWeight.w600,
                color: kBlack),
            children: [
          TextSpan(
              text: "SHOPPING",
              style: TextStyle(
                color: kLightBlue,
              )),
          TextSpan(text: " IS\nNEVER A BAD IDEA!!"),
        ]));
  }
}
