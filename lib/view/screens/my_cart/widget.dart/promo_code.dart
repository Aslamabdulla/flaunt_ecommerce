import 'package:flutter/material.dart';

class PromoCodeWidget extends StatelessWidget {
  const PromoCodeWidget({
    Key? key,
    required this.width,
    required this.offerController,
  }) : super(key: key);

  final double width;
  final TextEditingController offerController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width / 2,
      child: TextFormField(
        controller: offerController,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.redeem),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            filled: true,
            hintText: " Promo Code",
            hintStyle: TextStyle(fontSize: 12, height: 0)),
      ),
    );
  }
}
