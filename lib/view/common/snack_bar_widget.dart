import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

snackBarShowSuccess(String title, String message) {
  var context = Get.context;
  ElegantNotification.success(title: Text(title), description: Text(message))
      .show(context!);
}

snackBarShowError(String title, String message) {
  var context = Get.context;

  final width = ScreenUtil().screenWidth;
  ElegantNotification.error(
          width: width - 100.w, title: Text(title), description: Text(message))
      .show(context!);
}
