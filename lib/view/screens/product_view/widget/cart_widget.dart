import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/counter_cart.dart';
import 'package:flutter/material.dart';

class CountAndCartWidget extends StatelessWidget {
  const CountAndCartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CounterCartWidget(),
        ElevatedButton.icon(
            style:
                buttonStyleCart(250, 50, const Color.fromRGBO(43, 154, 184, 1)),
            onPressed: () {},
            icon: const Icon(Icons.local_mall),
            label: const Text("Add to Cart"))
      ],
    );
  }
}
