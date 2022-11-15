import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final googleSignin = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  String? profileImageurl = "";
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  Future googleLogin() async {
    CollectionReference _mainCollection = _fireStore.collection("users");
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
}
