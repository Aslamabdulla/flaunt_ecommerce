import 'package:flaunt_ecommenrce/model/cart_model/cart_model.dart';
import 'package:flaunt_ecommenrce/model/order_model/order_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/counter_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CounterCartProducts extends StatelessWidget {
  const CounterCartProducts({
    Key? key,
    required this.cartProducts,
  }) : super(key: key);

  final CartModel cartProducts;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartCountButtonWidget(
            icon: Icons.remove,
            fnctn: () async {
              if (int.parse(cartProducts.quantity) > 1) {
                await FirebaseDatabase.updateToCart(
                    productModel: OrderModel(
                        orderId: "",
                        address: [],
                        userEmail: userEmail,
                        productIndex: "0",
                        date: DateTime.now().toString(),
                        productId: cartProducts.productId,
                        brand: cartProducts.brand,
                        name: cartProducts.name,
                        price: cartProducts.price,
                        category: cartProducts.category,
                        subCategory: cartProducts.subCategory,
                        colors: cartProducts.colors,
                        description: cartProducts.description,
                        imageUrl: cartProducts.imageUrl,
                        isHotAndNew: cartProducts.isHotAndNew,
                        isTrending: cartProducts.isTrending,
                        isSummerCollection: cartProducts.isSummerCollection,
                        isNewArrival: cartProducts.isNewArrival,
                        isHotSales: cartProducts.isHotSales,
                        isPopularBrand: cartProducts.isPopularBrand,
                        quantity:
                            (int.parse(cartProducts.quantity) - 1).toString(),
                        total: double.parse(cartProducts.price) *
                            (int.parse(cartProducts.quantity) - 1)));
              } else {
                Get.snackbar("PROMPT", "Minimum Limit Reached");
              }
            }),
        kWidth5,
        Text(
          cartProducts.quantity,
          style: TextStyle(fontSize: 18.sp),
        ),
        kWidth5,
        CartCountButtonWidget(
            icon: Icons.add,
            fnctn: () async {
              if (int.parse(cartProducts.quantity) < 10) {
                await FirebaseDatabase.updateToCart(
                    productModel: OrderModel(
                        orderId: "",
                        address: [],
                        date: DateTime.now().toString(),
                        userEmail: userEmail,
                        productIndex: "0",
                        productId: cartProducts.productId,
                        brand: cartProducts.brand,
                        name: cartProducts.name,
                        price: cartProducts.price,
                        category: cartProducts.category,
                        subCategory: cartProducts.subCategory,
                        colors: cartProducts.colors,
                        description: cartProducts.description,
                        imageUrl: cartProducts.imageUrl,
                        isHotAndNew: cartProducts.isHotAndNew,
                        isTrending: cartProducts.isTrending,
                        isSummerCollection: cartProducts.isSummerCollection,
                        isNewArrival: cartProducts.isNewArrival,
                        isHotSales: cartProducts.isHotSales,
                        isPopularBrand: cartProducts.isPopularBrand,
                        quantity:
                            (int.parse(cartProducts.quantity) + 1).toString(),
                        total: double.parse(cartProducts.price) *
                            (int.parse(cartProducts.quantity) + 1)));
              } else {
                Get.snackbar("LIMIT REACHED", "MAXIMUM 10 QTY ALLOWED");
              }
            })
      ],
    );
  }
}
