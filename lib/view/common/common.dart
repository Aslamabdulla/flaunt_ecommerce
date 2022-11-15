import 'package:another_stepper/dto/stepper_data.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';

List<String> imageTopCategories = [
  "assets/images/products/shoes/dress1.png",
  "assets/images/products/shoes/shoe1.png",
  "assets/images/products/shoes/shoe3.png",
  "assets/images/products/shoes/shoe5.png",
  "assets/images/products/shoes/show2.png",
  "assets/images/products/shoes/shoe3.png",
  "assets/images/products/shoes/dress1.png",
  "assets/images/products/shoes/shoe1.png",
];
List<String> offerCategories = [
  "assets/images/Banner.png",
  "assets/images/Banner2.png",
  "assets/images/Banner3.png",
  "assets/images/Banner.png",
  "assets/images/Banner2.png",
  "assets/images/Banner3.png",
];
List<String> imageShoeCategories = [
  "assets/images/products/shoes/imageshoe.png",
  "assets/images/products/shoes/imageshoe2.png",
  "assets/images/products/shoes/imageshoe3.png",
  "assets/images/products/shoes/imageshoe4.png",
  "assets/images/products/shoes/imageshoe5.png",
  "assets/images/products/shoes/imageshoe6.png",
  "assets/images/products/shoes/imageshoe7.png",
  "assets/images/products/shoes/imageshoe.png",
];
List<String> gridCategories = [
  "assets/images/products/homeGrid/image.png",
  "assets/images/products/homeGrid/image1.png",
  "assets/images/products/homeGrid/image4.png",
  "assets/images/products/homeGrid/images7.png",
  "assets/images/products/homeGrid/images3.png",
  "assets/images/products/homeGrid/images6.png",
];

List<String> gridWomenCategories = [
  "assets/images/products/categories/withoutbg/women/womenProduct.png",
  "assets/images/products/homeGrid/image1.png",
  "assets/images/products/homeGrid/image4.png",
  "assets/images/products/categories/withoutbg/women/womenProduct1.png",
  "assets/images/products/homeGrid/images3.png",
  "assets/images/products/homeGrid/images6.png",
  "assets/images/products/categories/withoutbg/women/womenProduct2.png",
  "assets/images/products/categories/withoutbg/women/womenProduct3.png",
  "assets/images/products/categories/withoutbg/women/womenProduct4.png",
  "assets/images/products/categories/withoutbg/women/womenProduct5.png",
  "assets/images/products/categories/withoutbg/women/womenProduct6.png",
  "assets/images/products/categories/withoutbg/women/womenProduct7.png",
];
List<String> gridMenCategories = [
  "assets/images/products/homeGrid/image.png",
  "assets/images/products/categories/withoutbg/men/menProduct.png",
  "assets/images/products/categories/withoutbg/men/menProduct1.png",
  "assets/images/products/homeGrid/images7.png",
  "assets/images/products/categories/withoutbg/men/menProduct2.png",
  "assets/images/products/categories/withoutbg/men/menProduct3.png",
  "assets/images/products/categories/withoutbg/men/menProduct4.png",
  "assets/images/products/categories/withoutbg/men/menProduct5.png",
  "assets/images/products/categories/withoutbg/men/menProduct6.png",
  "assets/images/products/categories/withoutbg/men/menProduct7.png",
  "assets/images/products/categories/withoutbg/men/menProduct8.png",
  "assets/images/products/categories/withoutbg/men/menProduct9.png",
];

List<String> imagesNoBackgroundWomen = [
  "assets/images/products/categories/withoutbg/women/women.png",
  "assets/images/products/categories/withoutbg/women/women1.png",
  "assets/images/products/categories/withoutbg/women/women2.png",
  "assets/images/products/categories/withoutbg/women/women3.png",
];

List<String> imagesNoBackgroundMen = [
  "assets/images/products/categories/withoutbg/men/noBgMen (1).png",
  "assets/images/products/categories/withoutbg/men/noBgMen (4).png",
  "assets/images/products/categories/withoutbg/men/noBgMen (3).png",
  "assets/images/products/categories/withoutbg/men/noBgMen (2).png",
];

List<String> cartImages = [
  "assets/images/products/categories/withoutbg/women/womenProduct1.png",
  "assets/images/products/categories/withoutbg/men/menProduct2.png",
  "assets/images/products/categories/withoutbg/women/womenProduct3.png",
  "assets/images/products/categories/withoutbg/men/menProduct7.png",
  "assets/images/products/categories/withoutbg/women/womenProduct5.png",
  "assets/images/products/categories/withoutbg/men/menProduct6.png",
];
List<String> paymentButtonImage = [
  "assets/images/paymentButton/razorpay.png",
  "assets/images/paymentButton/googlepay.png",
  "assets/images/paymentButton/cod.png"
];

List<String> categoriesName = [
  "FOR MEN",
  "FOR WOMEN",
  "MEN'S JACKETS",
  "WOMEN SLEVES",
  "TRENDING",
  "ACCESSORIES"
];

final List<List<String>> categoryTopOffer = [
  imagesNoBackgroundMen,
  imagesNoBackgroundWomen,
  imagesNoBackgroundMen,
  imagesNoBackgroundWomen,
  imagesNoBackgroundMen,
  imagesNoBackgroundWomen
];
final List<List<String>> categoriesList = [
  gridMenCategories,
  gridWomenCategories,
  gridCategories,
  gridMenCategories,
  gridWomenCategories,
  gridCategories,
];

List<IconData> iconFlauntPay = [
  Icons.currency_rupee,
  Icons.qr_code_scanner_outlined,
  Icons.receipt_long,
  Icons.help_outline_outlined,
];
List<String> textFlauntPay = [
  "Add Money",
  "Scan & Pay",
  "Recent Transactions",
  "Get Help"
];

List<StepperData> stepperData = [
  StepperData(
    title: "Order Accepted",
    subtitle: "9:12 AM, 25 oct 2022 ",
  ),
  StepperData(
    title: "Processing Order",
    subtitle: "9:12 AM, 25 oct 2022 ",
  ),
  StepperData(
    title: "Product picked & started journey",
    subtitle: "",
  ),
  StepperData(
    title: "Dispatch in local warehouse",
    subtitle: "",
  ),
  StepperData(
    title: "Item Delivered Succesfully",
    subtitle: "",
  ),
];

List<String> pageViewCategories = [
  "assets/images/products/categories/withoutbg/women/womenProduct.png",
  "assets/images/products/categories/withoutbg/women/womenProduct8.png",
  "assets/images/products/categories/withoutbg/men/menProduct10.png",
  "assets/images/products/categories/withoutbg/women/womenProduct1.png",
  "assets/images/products/categories/withoutbg/men/menProduct11.png",
  "assets/images/products/categories/withoutbg/women/womenProduct9.png",
  "assets/images/products/categories/withoutbg/women/womenProduct2.png",
  "assets/images/products/categories/withoutbg/men/menProduct12.png",
  "assets/images/products/categories/withoutbg/women/womenProduct3.png",
  "assets/images/products/categories/withoutbg/women/womenProduct4.png",
  "assets/images/products/categories/withoutbg/women/womenProduct10.png",
  "assets/images/products/categories/withoutbg/women/womenProduct5.png",
  "assets/images/products/categories/withoutbg/women/womenProduct6.png",
  "assets/images/products/categories/withoutbg/women/womenProduct11.png",
  "assets/images/products/categories/withoutbg/men/menProduct13.png",
  "assets/images/products/categories/withoutbg/women/womenProduct12.png",
];
/////////style////////////

final buttonStyleoffer = ButtonStyle(
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    backgroundColor: MaterialStateProperty.all(Colors.orangeAccent.shade200));
addressScreenButton(Color color) => ButtonStyle(
    foregroundColor:
        MaterialStateProperty.all(color == Colors.black ? kWhite : kBlack),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    backgroundColor: MaterialStateProperty.all(color));

final decoration = BoxDecoration(
  borderRadius: BorderRadius.circular(20),
);
final decorationCartTile =
    BoxDecoration(borderRadius: BorderRadius.circular(20), color: kWhite);
decorationCategories(String imagesNoBg, int index) => BoxDecoration(
      image: DecorationImage(
        alignment: Alignment.bottomLeft,
        scale: .6,
        image: AssetImage(
          imagesNoBg,
        ),
      ),
      borderRadius: BorderRadius.circular(20),
      color: colors[index],
    );
decorationCart(String imagesNoBg, int index) => BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(
          imagesNoBg,
        ),
      ),
      borderRadius: BorderRadius.circular(20),
      color: colors[index],
    );

final gridstyle = TextStyle(
  fontSize: 16,
);
final gridstyleSub = TextStyle(
  fontSize: 14,
);

///////////Color//////////

List<Color> colors = const [
  Color.fromRGBO(245, 204, 233, .8),
  Color.fromRGBO(211, 245, 245, .8),
  Color.fromRGBO(218, 222, 228, .8),
  Color.fromRGBO(211, 245, 100, .8),
  Color.fromRGBO(219, 206, 230, .8),
  Color.fromRGBO(242, 230, 222, .8),
  Color.fromRGBO(187, 209, 230, .8),
  Color.fromRGBO(125, 220, 213, .8),
  Color.fromRGBO(211, 245, 245, .8),
  Color.fromRGBO(218, 222, 228, .8),
  Color.fromRGBO(211, 245, 100, .8),
];
List<Color> colorsProduct = const [
  Color.fromRGBO(245, 204, 233, .8),
  Color.fromRGBO(211, 245, 245, .8),
  Color.fromRGBO(218, 222, 228, .8),
  Color.fromRGBO(211, 245, 100, .8),
  Color.fromRGBO(211, 245, 245, .8),
  Color.fromRGBO(218, 222, 228, .8),
  Color.fromRGBO(211, 245, 100, .8),
];
buttonStyleCart(double width, double height, Color color) => ButtonStyle(
    minimumSize: MaterialStateProperty.all(Size(width, height)),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
    backgroundColor: MaterialStateProperty.all(color));

textStyleSize(double size, FontWeight fontWeight) =>
    TextStyle(fontSize: size, fontWeight: fontWeight, color: kBlack);

final boxGradientDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  gradient: const LinearGradient(colors: [
    Color.fromRGBO(43, 154, 184, 1),
    Color.fromRGBO(60, 174, 200, .5)
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
);

final boxGradientDecorFlauntPay = BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  gradient: const LinearGradient(colors: [
    Color.fromRGBO(43, 154, 184, 1),
    Color.fromRGBO(60, 174, 200, .5)
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
);
