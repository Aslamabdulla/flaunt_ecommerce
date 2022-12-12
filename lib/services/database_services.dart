import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final user = FirebaseAuth.instance.currentUser;
FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

final CollectionReference _mainCollection =
    _firebaseFirestore.collection("categories");
final CollectionReference _userCollection =
    _firebaseFirestore.collection("users");
final DocumentReference _userDocument = _userCollection.doc(user?.email);
