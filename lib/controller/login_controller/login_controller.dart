import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/dependency/shared_pref.dart';
import 'package:flaunt_ecommenrce/model/order_model/order_model.dart';
import 'package:flaunt_ecommenrce/services/database_services.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/common/snack_bar_widget.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_bottom_navigation/home_navigation.dart';
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
  RxString phoneNumber = "".obs;
  RxString otpNumber = "".obs;
  RxString verificationNumId = "".obs;

  bool firstTime = true;
  final googleSignin = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  String? profileImageurl = "";
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  OrderModel? recentOrders;
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

  Future firebaseOtp(String phoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber.toString().trim(),
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar("error", e.toString());
        },
        codeSent: (String verificationId, int? resendToken) async {
          snackBarShowSuccess("PROMPT", "OTP SENT SUCCESSFULLY");
          verificationNumId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      snackBarShowError("Error", e.toString());
    }
  }

  Future saveUserOtp() async {
    Get.offAll(() => const HomeNavigationPage(),
        transition: Transition.rightToLeft,
        duration: const Duration(microseconds: 400));
    CollectionReference _mainCollection =
        FirebaseFirestore.instance.collection("users");
    DocumentReference documentReference =
        _mainCollection.doc(FirebaseAuth.instance.currentUser!.uid);
    Map<String, dynamic> data = <String, dynamic>{
      "loggedin": DateTime.now(),
      "username": fireAuth.currentUser!.phoneNumber,
      "email": fireAuth.currentUser!.phoneNumber,
      "id": documentReference.id,
      "role": "user"
    };
    await documentReference.set(data, SetOptions(merge: true));
    DocumentReference subDocumentreference =
        documentReference.collection("account").doc(userEmail);
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.value.trim(),
        password: loginPasswodController.value.trim(),
      );
      snackBarShowSuccess("Success", "Login Successfull");
    } on FirebaseAuthException catch (e) {
      print(e);
      snackBarShowError("Error", "Error On Verifying");
    }
  }

  Future signUp() async {
    CollectionReference _mainCollection = _fireStore.collection("users");
    if (passWordController != confirmPasswordController) {
      snackBarShowError("Error", "Password Not Matching");
    } else if (passWordController.value.length < 6) {
      snackBarShowError("Error", "Password must have 6 letters");
    } else if (signUpemailController.value.isEmpty) {
      snackBarShowError("Error", "Email is empty");
    } else if (userNameController.value.isEmpty) {
      snackBarShowError("Error", "Username is empty");
    } else if (genderController.value.isEmpty) {
      snackBarShowError("Error", "Gender is empty");
    } else {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: signUpemailController.trim(),
            password: passWordController.trim());
        FirebaseAuth.instance.signOut();
        DocumentReference documentReference =
            _mainCollection.doc(signUpemailController.value);
        Map<String, dynamic> data = <String, dynamic>{
          "loggedin": DateTime.now(),
          "username": userNameController.value,
          "email": signUpemailController.value,
          "id": signUpemailController.value,
          "gender": genderController.value,
          "role": "user"
        };
        documentReference.set(data);
        DocumentReference subDocumentreference = documentReference
            .collection("account")
            .doc(userNameController.value);
        await subDocumentreference.set(data).whenComplete(() {
          snackBarShowSuccess("Success", "Registered Successfully");

          return print("Note item inserted into database");
        }).catchError((e) => print(e));
      } on FirebaseAuthException catch (e) {
        // Get.snackbar("Error", "Please Verify Details", colorText: kRedAccent);
        snackBarShowError("Error", e.toString());
      }
    }
  }

  otpSignIn() async {}

  @override
  void dispose() {
    loginController.dispose();
    cartController.dispose();

    // TODO: implement dispose
    super.dispose();
  }
}
