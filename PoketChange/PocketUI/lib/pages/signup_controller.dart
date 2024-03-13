import 'package:PocketChn/pages/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();


  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

   final _auth = FirebaseAuth.instance;
   var verificationId = ''.obs;


  // /// This func will be used to register user with [EMAIL] & [Password]
  // void registerUser(String email, String password) {
  //   String? error = AuthenticationRepository().instance.createUserWithEmailAndPassword(email, password) as String?;
  //   if (error != null) {
  //     Get.showSnackbar(GetSnackBar(message: error.toString()));
  //   }
  // }


  //Get phoneNo from user (Screen) and pass it to Auth Repository for Firebase Authentication
  

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo, // Phone number

      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },

      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },

      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },

      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provoded number is not valid');
        } else {
          Get.snackbar('Error', 'Something went wrong. Try again');
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }
}