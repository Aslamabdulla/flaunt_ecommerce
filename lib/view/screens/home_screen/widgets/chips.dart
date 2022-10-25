import 'package:chips_choice/chips_choice.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';

class Chips extends StatelessWidget {
  Chips({super.key});
  int tag = 1;
  List<String> options = [
    'Technology',
    'Fashion',
    'Men',
    'Women',
    'Shoes',
    'Accessories',
    'Home',
  ];

  @override
  Widget build(BuildContext context) {
    return ChipsChoice<int>.single(
      scrollPhysics: BouncingScrollPhysics(),
      choiceStyle: C2ChipStyle.filled(
          color: kWhite,
          borderRadius: BorderRadius.circular(20),
          selectedStyle: C2ChipStyle(
              backgroundColor: kBlack,
              borderRadius: BorderRadius.circular(20))),
      value: tag,
      onChanged: (val) => () => tag = val,
      choiceItems: C2Choice.listFrom<int, String>(
        source: options,
        value: (i, v) => i,
        label: (i, v) => v,
      ),
    );
  }
}
