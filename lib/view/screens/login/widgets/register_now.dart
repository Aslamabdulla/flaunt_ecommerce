// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flaunt_ecommenrce/controller/login_controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/signup/signup.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    Key? key,
    required this.text1,
    required this.text2,
    required this.fnctn,
  }) : super(key: key);
  final String text1;
  final String text2;
  final Function() fnctn;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fnctn,
      child: RichText(
          text: TextSpan(
              style: const TextStyle(
                  fontFamily: 'Oswald', fontSize: 12, color: kBlack),
              children: [
            TextSpan(
              text: text1,
            ),
            TextSpan(
                text: text2,
                style: const TextStyle(
                    color: kBlack, fontWeight: FontWeight.w600)),
          ])),
    );
  }
}
