import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';

class ColorWidget extends StatelessWidget {
  const ColorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            decoration: BoxDecoration(
                border: Border.all(width: .5),
                borderRadius: BorderRadius.circular(20)),
            child: const Center(
              child: Text(
                "COLORS",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          kHeight10,
          Row(
            children: List.generate(
                4,
                (index) => Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        backgroundColor: colorsProduct[index],
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
