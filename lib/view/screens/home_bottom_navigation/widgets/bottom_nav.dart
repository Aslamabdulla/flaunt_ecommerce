import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flaunt_ecommenrce/controller/bottom_controller/bottom_controller.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/login/login.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key? key,
    required this.bottomController,
  }) : super(key: key);
  final BottomController bottomController;
  @override
  Widget build(BuildContext context) {
    return BottomBarWithSheet(
        controller: bottomController.bottomNavController,
        onSelectItem: (index) {
          return bottomController.screenChange(index);
        },
        mainActionButtonTheme: const MainActionButtonTheme(
            icon: Icon(
              Icons.shopping_cart,
              color: kBlack,
            ),
            color: Color.fromRGBO(79, 165, 185, 1)),
        sheetChild: const LoginPage(),
        bottomBarTheme: const BottomBarTheme(
            decoration: BoxDecoration(color: Colors.white),
            itemIconColor: Colors.grey,
            selectedItemIconColor: kBlack),
        items: const [
          BottomBarWithSheetItem(icon: Icons.home_filled, label: "Home"),
          BottomBarWithSheetItem(
              icon: Icons.account_balance_wallet, label: "Wallet"),
          BottomBarWithSheetItem(icon: Icons.local_mall, label: "Hot&New"),
          BottomBarWithSheetItem(icon: Icons.account_circle, label: "Account"),
        ]);
  }
}
