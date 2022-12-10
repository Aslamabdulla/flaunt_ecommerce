import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final Function() fnctn;
  final IconData icon;
  const IconButtonWidget({
    Key? key,
    required this.fnctn,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: fnctn,
      icon: Icon(icon),
    );
  }
}
