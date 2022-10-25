import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpMethodWidget extends StatelessWidget {
  const SignUpMethodWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final double height;
  final double width;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(241, 246, 251, 1),
          borderRadius: BorderRadius.circular(10)),
      height: height * .05,
      width: width * .1,
      child: Center(
        child: IconButton(
          icon: FaIcon(icon),
          onPressed: () {},
          color: color,
        ),
      ),
    );
  }
}