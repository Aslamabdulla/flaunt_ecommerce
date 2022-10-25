// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class OfferTile extends StatelessWidget {
  final String image;
  const OfferTile({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: width,
      height: height * .24,
      child: Image.asset(
        image,
        fit: BoxFit.contain,
      ),
    );
  }
}
