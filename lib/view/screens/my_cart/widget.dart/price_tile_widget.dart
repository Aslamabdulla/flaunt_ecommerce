import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/model/cart_model/cart_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TotalPriceRowWidget extends StatelessWidget {
  final String leading;
  String trailing;
  final double size1;
  final double size2;
  final double left;

  TotalPriceRowWidget({
    Key? key,
    required this.leading,
    required this.trailing,
    required this.size1,
    required this.size2,
    required this.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return StreamBuilder(
        stream: FirebaseDatabase.readCart(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Text("0");
          } else if (snapshot.hasError) {
            return Text("Error on fetching");
          } else {
            if (cartController.checkBool.value) {
              cartController.totalPriceCart.value = 0.0;
              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                final totalPrice =
                    CartModel.fromJson(json: snapshot.data!.docs[i].data());
                cartController.totalPriceCart.value =
                    totalPrice.total! + cartController.totalPriceCart.value;
              }
            }

            return PriceWidget(
                left: left,
                width: width,
                leading: leading,
                size1: size1,
                size2: size2);
          }
        });
  }
}

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    Key? key,
    required this.left,
    required this.width,
    required this.leading,
    required this.size1,
    required this.size2,
  }) : super(key: key);

  final double left;
  final double width;
  final String leading;
  final double size1;
  final double size2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: left, right: 50, top: 10),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: textStyleSize(size1, FontWeight.w500),
          ),
          SizedBox(
            height: 25,
            width: 100,
            child: Text(
              "₹${cartController.totalPriceCart.value.toString()}",
              textAlign: TextAlign.center,
              style: textStyleSize(size2, FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
