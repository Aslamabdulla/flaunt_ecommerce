import 'package:flaunt_ecommenrce/view/screens/checkout_page/widgets/payment_button.dart';
import 'package:flutter/material.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, height * .13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            List.generate(3, (index) => PaymentButtonWidget(index: index)),
      ),
    );
  }
}
