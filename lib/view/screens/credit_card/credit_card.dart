import 'package:flaunt_ecommenrce/controller/credit_card_controller/credit_card_controller.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/wallet_credit_card.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/row_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

CreditCardController creditCardController = Get.put(CreditCardController());

class CreditCardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreditCardScreenState();
  }
}

class CreditCardScreenState extends State<CreditCardScreen> {
  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil().screenHeight;
    final width = ScreenUtil().screenWidth;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: kBlack,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "CREDIT CARD",
          style: textStyleSize(18, FontWeight.w600),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipperPath(),
            child: Container(
              height: height / 1.9.h,
              decoration: customClipperBackground,
            ),
          ),
          SafeArea(child: SafeArea(
            child: Builder(builder: (context) {
              return GetX<CreditCardController>(
                  init: CreditCardController(),
                  builder: (creditController) {
                    return Column(
                      children: <Widget>[
                        CreditCardWidget(
                          glassmorphismConfig:
                              creditController.useGlassMorphism.value
                                  ? Glassmorphism.defaultConfig()
                                  : null,
                          cardNumber: creditController.cardNumber.value,
                          expiryDate: creditController.expiryDate.value,
                          cardHolderName: creditController.cardHolderName.value,
                          cvvCode: creditController.cvvCode.value,
                          bankName: 'Axis Bank',
                          showBackView: creditController.isCvvFocused.value,
                          obscureCardNumber: true,
                          obscureCardCvv: true,
                          isHolderNameVisible: true,
                          cardBgColor: Colors.red,
                          isSwipeGestureEnabled: true,
                          onCreditCardWidgetChange:
                              (CreditCardBrand creditCardBrand) {},
                          customCardTypeIcons: <CustomCardTypeIcon>[
                            CustomCardTypeIcon(
                              cardType: CardType.mastercard,
                              cardImage: Image.asset(
                                'assets/images/mastercard.png',
                                height: 48.h,
                                width: 48.w,
                              ),
                            ),
                          ],
                        ),
                        RowWidget(
                            mainAxis: MainAxisAlignment.spaceBetween,
                            text: "Credit Card Details",
                            top: 20,
                            left: 15,
                            fontSize: 18.sp),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                CreditCardForm(
                                  formKey: creditController.formKey.value,
                                  obscureCvv: true,
                                  obscureNumber: true,
                                  cardNumber: creditController.cardNumber.value,
                                  cvvCode: creditController.cvvCode.value,
                                  isHolderNameVisible: true,
                                  isCardNumberVisible: true,
                                  isExpiryDateVisible: true,
                                  cardHolderName:
                                      creditController.cardHolderName.value,
                                  expiryDate: creditController.expiryDate.value,
                                  themeColor: Colors.blue,
                                  textColor: kBlack,
                                  cardNumberDecoration: InputDecoration(
                                    labelText: 'Number',
                                    hintText: 'XXXX XXXX XXXX XXXX',
                                    hintStyle: const TextStyle(color: kBlack),
                                    labelStyle: const TextStyle(color: kBlack),
                                    focusedBorder: creditController.border,
                                    enabledBorder: creditController.border,
                                  ),
                                  expiryDateDecoration: InputDecoration(
                                    hintStyle: const TextStyle(color: kBlack),
                                    labelStyle: const TextStyle(color: kBlack),
                                    focusedBorder: creditController.border,
                                    enabledBorder: creditController.border,
                                    labelText: 'Expired Date',
                                    hintText: 'XX/XX',
                                  ),
                                  cvvCodeDecoration: InputDecoration(
                                    hintStyle: const TextStyle(color: kBlack),
                                    labelStyle: const TextStyle(color: kBlack),
                                    focusedBorder: creditController.border,
                                    enabledBorder: creditController.border,
                                    labelText: 'CVV',
                                    hintText: 'XXX',
                                  ),
                                  cardHolderDecoration: InputDecoration(
                                    hintStyle: const TextStyle(color: kBlack),
                                    labelStyle: const TextStyle(color: kBlack),
                                    focusedBorder: creditController.border,
                                    enabledBorder: creditController.border,
                                    labelText: 'Card Holder',
                                  ),
                                  onCreditCardModelChange:
                                      onCreditCardModelChange,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Glass Effect',
                                      style: TextStyle(
                                        color: kBlack,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    Switch(
                                      value: creditController
                                          .useGlassMorphism.value,
                                      inactiveTrackColor: Colors.grey,
                                      activeColor: Colors.white,
                                      activeTrackColor: Colors.green,
                                      onChanged: (bool value) => setState(() {
                                        creditController
                                            .useGlassMorphism.value = value;
                                      }),
                                    ),
                                  ],
                                ),
                                kHeight10,
                                LoginButtonWidget(
                                    name: "Add Card",
                                    height: 40.h,
                                    width: 150.w,
                                    fnctn: () =>
                                        creditController.validateCard()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            }),
          ))
        ],
      ),
    );
  }

  void onCreditCardModelChange(
    CreditCardModel? creditCardModel,
  ) {
    creditCardController.cardNumber.value = creditCardModel!.cardNumber;
    creditCardController.expiryDate.value = creditCardModel.expiryDate;
    creditCardController.cardHolderName.value = creditCardModel.cardHolderName;
    creditCardController.cvvCode.value = creditCardModel.cvvCode;
    creditCardController.isCvvFocused.value = creditCardModel.isCvvFocused;
  }
}
