import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/model/order_model/order_model.dart';
import 'package:flaunt_ecommenrce/model/product_model/product_model.dart';
import 'package:flaunt_ecommenrce/model/product_search.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:get/get.dart';

class BottomController extends GetxController {
  var newIndex = 0.obs;
  List<SearchModel> products = [];
  BottomBarWithSheetController bottomNavController =
      BottomBarWithSheetController(initialIndex: 0);
  screenChange(var index) {
    newIndex.value = index;
    update();
  }

  search(String value) async {
    // await FirebaseDatabase.searchProducts(value);
    var result = FirebaseDatabase.searchFromFirebase(value);
    products = await result.then((value) =>
        value.docs.map((e) => SearchModel.fromMap(e.data())).toList());

    // products.map((e) => product.add(e));
    print(products.length);
//  product =  result.then((value) => value.docs.map((e) => Product.fromSnapshot(e.data())));
    update();
  }
}
