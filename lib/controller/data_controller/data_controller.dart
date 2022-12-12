// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flaunt_ecommenrce/model/order_model/order_model.dart';
// import 'package:flaunt_ecommenrce/model/product_model/product_model.dart';
// import 'package:flaunt_ecommenrce/model/product_search.dart';
// import 'package:flaunt_ecommenrce/services/firebase_services.dart';
// import 'package:get/get.dart';

// class DataController extends GetxController {
//   List<Product> products = [];
//   List<String> category = [];
//   List<OrderModel> productModel = [];
//   List<Map<String, dynamic>> productspaths = [];
//   int count = 0;
//   List<Product> items = [];
//   List<String> itemsId = [];
//   List<String> subCategory = [];
//   List<String> men = ['Blazer', 'Jeans', 'Shirts', 'Shorts'];
//   List<String> women = ['Ethnic Wear', 'Kurthas', 'PaertyWears'];
//   menCategory() async {
//     for (var element in category) {
//       await readSubCategories(element);
//     }

//     print(category.length);
//   }

//   Future readSubCategories(String category) async {
//     final fireData = await FirebaseFirestore.instance
//         .collection('categories')
//         .doc(category)
//         .collection('subcategories')
//         .get();
//     var data = fireData.docs.map((e) => e.id.toString()).toList();
//     Map<String, dynamic> map = {
//       "category": category,
//       "subcategory": data.toList()
//     };

//     productspaths.add(map);

//     await addAllProducts();
//   }

//   Future addAllProducts() async {
//     for (var element in productspaths) {
//       var subCategory = await element['subcategory'] as List<String>;

//       for (int i = 0; i < element['subcategory'].length; i++) {
//         var fireData = await FirebaseFirestore.instance
//             .collection('categories')
//             .doc(element['category'].toString())
//             .collection('subcategories')
//             .doc(element['subcategory'][i])
//             .collection('products')
//             .get();
//         items = fireData.docs.map((e) => Product.fromSnapshot(e)).toList();
//         itemsId = fireData.docs.map((e) => e.id).toList();
//         print(itemsId);
//         for (int i = 0; i < items.length; i++) {
//           await FirebaseFirestore.instance
//               .collection('AllProducts')
//               .doc(itemsId[i])
//               .set(items[i].toMap());
//           print(items[i].category);
//         }
//         items.clear();
//         itemsId.clear();
//       }
//     }
//     productspaths.clear();
//     // productspaths.forEach((element) {

//     //   var sub = element['subcategory'];

//     // });
//   }
// }
