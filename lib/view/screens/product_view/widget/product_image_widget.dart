import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    Key? key,
    required this.imageUrl,
    required this.index,
  }) : super(key: key);

  final List imageUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.topCenter,
              image: NetworkImage(imageUrl[index]),
              fit: BoxFit.cover)),
    );
  }
}
