import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';

class AccountListTile extends StatelessWidget {
  final String text;
  final IconData leading;
  final IconData trailing;
  final Function() onTap;
  const AccountListTile({
    Key? key,
    required this.text,
    required this.leading,
    required this.trailing,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: kWhite, borderRadius: BorderRadius.circular(20)),
        width: 250,
        height: 45,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          kWidth10,
          Icon(leading),
          Spacer(),
          Text(text),
          Spacer(),
          Icon(trailing),
          kWidth10
        ]),
      ),
    );
  }
}
