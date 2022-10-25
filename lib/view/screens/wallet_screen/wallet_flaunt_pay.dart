// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/common/discount_offers.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/row_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/wallet_screen/widgets/credit_card.dart';

class FlauntPayScreen extends StatelessWidget {
  const FlauntPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: kBlack,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "FLAUNT PAY",
          style: textStyleSize(20, FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipperPath(),
            child: Container(
              height: height / 2.5,
              decoration: customClipperBackground,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                height: height,
                width: width,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const DiscountOffers(),
                    RowWidget(
                        mainAxis: MainAxisAlignment.spaceBetween,
                        text: "Saved Cards",
                        top: 20,
                        left: 20,
                        fontSize: 18),
                    kHeight20,
                    Container(
                        height: height * .32,
                        width: width,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 2,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              CreditCard(index: index),
                        )),
                    WalletBalanceWidget(),
                    kHeight15,
                    Row(
                      children: [kWidth15, Text("WALLET SETUP")],
                    ),
                    kHeight20,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      height: height * .2,
                      width: width,
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => WalletPaytileWidgets(
                                index: index,
                              ),
                          separatorBuilder: (context, index) => kWidth10,
                          itemCount: textFlauntPay.length),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WalletBalanceWidget extends StatelessWidget {
  const WalletBalanceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 15),
          padding: EdgeInsets.all(20),
          decoration: boxGradientDecoration,
          height: height * .14,
          width: width * .7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Wallet Balance",
                    style: textStyleSize(16, FontWeight.w500),
                  ),
                  Spacer(),
                  Icon(Icons.wallet)
                ],
              ),
              Text(
                "₹145,76",
                style: textStyleSize(28, FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WalletPaytileWidgets extends StatelessWidget {
  const WalletPaytileWidgets({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: height * .18,
      width: width * .3,
      decoration: boxGradientDecorFlauntPay,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            kHeight5,
            Icon(
              iconFlauntPay[index],
              size: 40,
            ),
            Text(
              textFlauntPay[index],
              style: textStyleSize(18, FontWeight.w500),
            ),
            kHeight5
          ]),
    );
  }
}



    // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    // final GlobalKey<FormFieldState<String>> cardNumberKey =
    //     GlobalKey<FormFieldState<String>>();
    // final GlobalKey<FormFieldState<String>> cvvCodeKey =
    //     GlobalKey<FormFieldState<String>>();
    // final GlobalKey<FormFieldState<String>> expiryDateKey =
    //     GlobalKey<FormFieldState<String>>();
    // final GlobalKey<FormFieldState<String>> cardHolderKey =
    //     GlobalKey<FormFieldState<String>>();
    // String cardNumber = '';
    // String expiryDate = '';
    // String cardHolderName = '';
    // String cvvCode = '';
    // bool isCvvFocused = false;
    // bool useGlassMorphism = false;
    // bool useBackgroundImage = false;