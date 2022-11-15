import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

final CollectionReference _mainCollection = _firestore.collection("categories");

class FirebaseDatabase {
  String? id;

  static Stream<QuerySnapshot> reaCategory() {
    return _mainCollection.snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> readSubCategories(
      String category) {
    return _firestore
        .collection('categories')
        .doc(category)
        .collection('subcategories')
        .snapshots();
  }
}
