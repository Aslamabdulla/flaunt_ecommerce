import 'package:flaunt_ecommenrce/view/screens/checkout_page/widgets/payment_button.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  var _razorpay = Razorpay();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, height * .13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton.icon(
              onPressed: () {
                var options = {
                  'key': 'rzp_test_oOOCFeNPdprroz',
                  'amount': 50, //in the smallest currency sub-unit.
                  'name': 'FLAUNT',
                  'order_id':
                      'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
                  'description': 'Fine T-Shirt',
                  'timeout': 60, // in seconds
                  'prefill': {
                    'contact': '9123456789',
                    'email': 'gaurav.kumar@example.com'
                  }
                };
                _razorpay.open(options);
              },
              icon: Icon(Icons.payment),
              label: Text("Razorpay"))
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("success");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }
}
