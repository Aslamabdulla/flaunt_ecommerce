import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HotAndNewController extends GetxController {
  @override
  void onInit() {
    pageviewController.initialPage;
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  final pageviewController = PageController(initialPage: 0);
}
