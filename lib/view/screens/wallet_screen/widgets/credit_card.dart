// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/credit_card/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:flaunt_ecommenrce/view/common/widgets/wallet_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreditCard extends StatelessWidget {
  final int index;
  const CreditCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Get.to(() => CreditCardScreen()),
      child: Column(
        children: [
          CreditCardWidget(
            height: 235.h,
            width: 350.w,
            cardNumber: creditCardController.cardNumber.value,
            expiryDate: creditCardController.expiryDate.value,
            cardHolderName: creditCardController.cardHolderName.value,
            cvvCode: creditCardController.cvvCode.value,
            bankName: index == 0 ? 'Axis Bank' : 'HDFC Bank',
            showBackView: creditCardController.isCvvFocused.value,
            obscureCardNumber: true,
            obscureCardCvv: true,
            isHolderNameVisible: true,
            cardBgColor: index == 0 ? Colors.red : Colors.deepPurpleAccent,
            isSwipeGestureEnabled: true,
            textStyle: TextStyle(fontSize: 12.sp, color: kWhite),
            onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            customCardTypeIcons: <CustomCardTypeIcon>[
              CustomCardTypeIcon(
                cardType: index == 0 ? CardType.mastercard : CardType.visa,
                cardImage: Image.asset(
                  'assets/images/mastercard.png',
                  height: 50.h,
                  width: 48.w,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
