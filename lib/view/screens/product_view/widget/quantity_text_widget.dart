import 'package:flutter/material.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.quantity,
  }) : super(key: key);

  final double width;
  final double height;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    print(width * .35);
    print(height * .06);
    return Container(
      width: width * .35,
      height: height * .06,
      decoration: BoxDecoration(
          border: Border.all(width: .5),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "QUANTITY : ",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(quantity)
        ],
      ),
    );
  }
}
