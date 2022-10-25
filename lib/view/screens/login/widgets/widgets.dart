import 'package:flutter/material.dart';

const customClipperBackground = BoxDecoration(
  shape: BoxShape.rectangle,
  gradient: const LinearGradient(colors: [
    Color.fromRGBO(43, 154, 184, 1),
    Color.fromRGBO(60, 174, 200, .4)
  ], begin: Alignment.topRight, end: Alignment.bottomLeft),
);
