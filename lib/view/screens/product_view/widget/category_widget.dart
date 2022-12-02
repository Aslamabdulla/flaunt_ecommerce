import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.category,
  }) : super(key: key);

  final double width;
  final double height;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Text(
          "CATEGORY : ",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
