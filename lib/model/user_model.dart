// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserModel {
//   static const ID = "id";
//   static const NAME = "name";
//   static const EMAIL = "email";

//   String? id;
//   String? name;
//   String? email;
//   UserModel({
//     this.id,
//     this.name,
//     this.email,
//   });
//   UserModel.fromSnapshot(DocumentSnapshot snapshot) {
//     name = snapshot.data()![NAME];
//     email = snapshot.data()[EMAIL];
//     id = snapshot.data()[ID];
//   }
// }
