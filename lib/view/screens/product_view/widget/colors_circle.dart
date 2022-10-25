import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flutter/material.dart';

class ColorsCircleWidget extends StatelessWidget {
  const ColorsCircleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
          children: List.generate(
              5,
              (index) => Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      backgroundColor: colors[index],
                    ),
                  ))),
    );
  }
}
