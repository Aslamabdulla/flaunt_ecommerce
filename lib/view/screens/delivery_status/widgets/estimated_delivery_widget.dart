import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/row_widget.dart';
import 'package:flutter/material.dart';

class EstimatedDeliveryWidget extends StatelessWidget {
  const EstimatedDeliveryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        RowWidget(
            mainAxis: MainAxisAlignment.center,
            text: "Estimated Delivery : ",
            top: 20,
            left: 0,
            fontSize: 16),
        RowWidget(
            mainAxis: MainAxisAlignment.center,
            text: "7-14 DAYS",
            top: 20,
            left: 0,
            fontSize: 16),
      ],
    );
  }
}
