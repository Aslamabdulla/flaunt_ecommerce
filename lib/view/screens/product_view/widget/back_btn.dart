import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteButtonAppbar extends StatelessWidget {
  const FavouriteButtonAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              Color.fromRGBO(43, 154, 184, 1),
              Color.fromRGBO(60, 174, 200, .4),
            ])),
        child: Center(
          child: Icon(Icons.chevron_left),
        ),
      ),
    );
  }
}
