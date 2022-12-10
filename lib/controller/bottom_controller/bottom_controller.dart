import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:get/get.dart';

class BottomController extends GetxController {
  var newIndex = 0.obs;
  BottomBarWithSheetController bottomNavController =
      BottomBarWithSheetController(initialIndex: 0);
  screenChange(var index) {
    newIndex.value = index;
    update();
  }
}
