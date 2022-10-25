// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

class AddAddressButtonWidget extends StatelessWidget {
  const AddAddressButtonWidget({
    Key? key,
    required this.name,
    required this.height,
    required this.width,
    required this.fnctn,
  }) : super(key: key);
  final String name;
  final double height;
  final double width;
  final Function() fnctn;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fnctn,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(43, 154, 184, 1),
            Color.fromRGBO(60, 174, 200, .5)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        height: height,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
