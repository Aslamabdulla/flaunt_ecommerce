import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

snackBarShowSuccess(String title, String message) {
  var context = Get.context;
  ElegantNotification.success(title: Text(title), description: Text(message))
      .show(context!);
}

snackBarShowError(String title, String message) {
  var context = Get.context;
  ElegantNotification.error(
          width: Get.width - 100,
          title: Text(title),
          description: Text(message))
      .show(context!);
}
