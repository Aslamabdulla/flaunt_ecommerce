import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flaunt_ecommenrce/dependency/shared_pref.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  RxString emailController = "".obs;
  RxString signUpemailController = "".obs;
  RxString passWordController = "".obs;
  RxString loginPasswodController = "".obs;
  RxString userNameController = "".obs;
  RxString confirmPasswordController = "".obs;
  RxString genderController = "".obs;
  bool firstTime = true;
  final googleSignin = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  String? profileImageurl = "";
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final fireAuth = FirebaseAuth.instance;
  Future signout() async {
    await googleSignin.signOut();
    update();
  }

  Future googleLogin() async {
    CollectionReference _mainCollection = _fireStore.collection("users");
    try {
      final googleUser = await googleSignin.signIn();
      if (googleUser == null) {
        return;
      } else {}
      _user = googleUser;
      profileImageurl = _user!.photoUrl;
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      if (fireAuth.currentUser == null) {
        fireAuth.signInWithCredential(credential);
      }
      await FirebaseAuth.instance.signInWithCredential(credential);
      DocumentReference documentReference = _mainCollection.doc(user.email);
      Map<String, dynamic> data = <String, dynamic>{
        "loggedin": DateTime.now(),
        "username": _user!.displayName,
        "email": _user!.email,
        "id": documentReference.id,
        "role": "user"
      };
      await documentReference.set(data, SetOptions(merge: true));

      DocumentReference subDocumentreference =
          documentReference.collection("account").doc(user.displayName);
      // CollectionReference notesItemCollection =
      //     _mainCollection.doc(user.email).collection('account');
      // if (notesItemCollection.doc(user.displayName).toString() ==
      //     user.displayName.toString()) {
      //   return;
      // } else {

      // }

      await subDocumentreference
          .set(data)
          .whenComplete(() => print("user datails inserted into database"))
          .catchError((e) => print(e));
      firstTime = false;
      SharedPref.setLogin(firstTime);
    } catch (e) {
      print(e);
    }

    update();
  }

  Future firebaseOtp(int phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber.toString(),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
  // @override
  // void dispose() {
  //   controller.dispose();
  //   focusNode.dispose();
  //   super.dispose();
  // }

  Future signIn() async {
    print(emailController);
    print(loginPasswodController);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.value.trim(),
        password: loginPasswodController.value.trim(),
      );
      Get.snackbar("Success", "Verified Succesfully");
    } on FirebaseAuthException catch (e) {
      print(e);
      Get.snackbar("Error", "Error on Verifiying");
    }
  }

  Future signUp() async {
    print(signUpemailController + "hello");
    CollectionReference _mainCollection = _fireStore.collection("users");
    if (passWordController == confirmPasswordController) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: signUpemailController.trim(),
            password: passWordController.trim());

        DocumentReference documentReference =
            _mainCollection.doc(signUpemailController.value);
        Map<String, dynamic> data = <String, dynamic>{
          "loggedin": DateTime.now(),
          "username": userNameController.value,
          "email": signUpemailController.value,
          "id": signUpemailController.value,
          "role": "user"
        };
        documentReference.set(data);
        DocumentReference subDocumentreference = documentReference
            .collection("account")
            .doc(userNameController.value);
        await subDocumentreference.set(data).whenComplete(() {
          Get.snackbar("Success", "Registered Successfully");

          return print("Note item inserted into database");
        }).catchError((e) => print(e));
      } on FirebaseAuthException catch (e) {
        Get.snackbar("Error", "Please Verify Details", colorText: kRedAccent);
      }
    } else {
      Get.snackbar("ERROR", "Password Not Matching");
    }
  }
}
