import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/checkout_page/widgets/payment_methods.dart';
import 'package:flaunt_ecommenrce/view/screens/payment_success/payment_success.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  late Razorpay _razorpay;

  @override
  void onInit() {
    // TODO: implement onInit

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    Get.snackbar("SUCCESS", "YOUR ORDER  IS PLACED SUCCESSFULLY ",
        colorText: kGreenAccent);

    cartController.checkBool.value = false;
    cartController.addOrdersToDb();
    Get.offAll(() => PaymentSuccessScreen());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar("FAILED", " ${response.message}", colorText: kRedAccent);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }
  void dispatchPayment(
      double amount, String name, String wallet, String email) {
    var options = {
      'key': 'rzp_test_oOOCFeNPdprroz',
      'amount': amount * 100,
      'name': 'Flaunt',
      'description': 'Flaunt Puchase Product',
      'prefill': {
        'contact': '9123456789',
        'email': email,
      },
      'external': [wallet],
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
  }
}
