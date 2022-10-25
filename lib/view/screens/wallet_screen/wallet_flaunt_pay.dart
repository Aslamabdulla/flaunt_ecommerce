import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/common/discount_offers.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/row_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class FlauntPayScreen extends StatelessWidget {
  const FlauntPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final GlobalKey<FormFieldState<String>> cardNumberKey =
        GlobalKey<FormFieldState<String>>();
    final GlobalKey<FormFieldState<String>> cvvCodeKey =
        GlobalKey<FormFieldState<String>>();
    final GlobalKey<FormFieldState<String>> expiryDateKey =
        GlobalKey<FormFieldState<String>>();
    final GlobalKey<FormFieldState<String>> cardHolderKey =
        GlobalKey<FormFieldState<String>>();
    String cardNumber = '';
    String expiryDate = '';
    String cardHolderName = '';
    String cvvCode = '';
    bool isCvvFocused = false;
    bool useGlassMorphism = false;
    bool useBackgroundImage = false;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: kBlack,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "FLAUNT PAY",
        ),
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipperPath(),
            child: Container(
              height: height / 2.4,
              decoration: customClipperBackground,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const DiscountOffers(),
                RowWidget(
                    mainAxis: MainAxisAlignment.spaceBetween,
                    text: "Saved Cards",
                    top: 20,
                    left: 20,
                    fontSize: 18),
                CreditCardForm(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  formKey: formKey, // Required
                  cardNumberKey: cardNumberKey,
                  cvvCodeKey: cvvCodeKey,
                  expiryDateKey: expiryDateKey,
                  cardHolderKey: cardHolderKey,
                  onCreditCardModelChange:
                      (CreditCardModel data) {}, // Required
                  themeColor: Colors.red,
                  obscureCvv: true,
                  obscureNumber: true,
                  isHolderNameVisible: false,
                  isCardNumberVisible: false,
                  isExpiryDateVisible: false,
                  cardNumberValidator: (String? cardNumber) {},
                  expiryDateValidator: (String? expiryDate) {},
                  cvvValidator: (String? cvv) {},
                  cardHolderValidator: (String? cardHolderName) {},
                  onFormComplete: () {
                    // callback to execute at the end of filling card data
                  },
                  cardNumberDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number',
                    hintText: 'XXXX XXXX XXXX XXXX',
                  ),
                  expiryDateDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Expired Date',
                    hintText: 'XX/XX',
                  ),
                  cvvCodeDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CVV',
                    hintText: 'XXX',
                  ),
                  cardHolderDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Card Holder',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
