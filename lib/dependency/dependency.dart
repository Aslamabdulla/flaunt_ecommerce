import 'package:flaunt_ecommenrce/controller/cart_controller/cart_controller.dart';
import 'package:flaunt_ecommenrce/controller/login_controller/login_controller.dart';
import 'package:get/get.dart';

LoginController loginController = Get.put(LoginController(), permanent: true);

CartController cartController = Get.put(CartController(), permanent: true);
