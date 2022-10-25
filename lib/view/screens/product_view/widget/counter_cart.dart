import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';

class CounterCartWidget extends StatelessWidget {
  const CounterCartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Color.fromRGBO(43, 154, 184, 1))),
          height: 30,
          width: 30,
          child: Center(
            child: Icon(Icons.add),
          ),
        ),
        kWidth10,
        Text("1"),
        kWidth10,
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Color.fromRGBO(43, 154, 184, 1))),
          height: 30,
          width: 30,
          child: Center(
            child: Icon(Icons.remove),
          ),
        ),
      ],
    );
  }
}
