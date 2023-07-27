import 'dart:async';
// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking/pages/home_screen.dart';
// import 'package:movie_booking/pages/home_screen.dart';
import 'package:movie_booking/pages/login_screen.dart';
import 'package:movie_booking/utils/mytheme.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  bool isLogging = false;
  User? get user => _user.value;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {

    super.onReady();
    _user =  Rx<User?> (auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, loginRedirect);
  }

  loginRedirect(User? user){
    Timer(Duration(seconds:isLogging? 0:  2), () { 
      if(user == null) {
        isLogging = false;
        update();
        Get.offAll(()=> const LoginScreen());
      } else {
        isLogging = true;
        update();
        Get.offAll(()=> const HomeScreen());
      }
    });
  
  }

  void registerUser(email, password) async {
  try {
    isLogging =true;
    update();
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    //define error
    getErrorSnackbar("Account Creating Failed", e);

  }
}

  void login(email, password) async {
  try {
    isLogging = true;
    update();
    await auth.signInWithEmailAndPassword(email: email, password: password);
    getSuccessSnackBar("Successfully logged in as ${_user.value!.email}");
  } on FirebaseAuthException catch (e) {
    //define error
    getErrorSnackbar("Login Failed", e);

    //keytool -exportcert -keystore C:\Users\sacha\.android\debug.keystore -list -v
    //keytool -list -v -keystore"sacha\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
    //keytool -exportcert -alias androiddebugkey -keystore C:\Users\sacha\.android -list -v
    //SHA1: E0:7C:53:66:BA:85:5B:6F:1E:18:6B:8F:2D:5A:71:C3:87:95:21:8C

  }
}

  void googleLogin() async{
    final GoogleSignIn googleSignIn = GoogleSignIn();
    isLogging = true;
    update();

    try {
    final GoogleSignInAccount? googleSignInAccount=  await googleSignIn.signIn();
    if(googleSignInAccount != null){
      final GoogleSignInAuthentication? googleAuth= await googleSignInAccount.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await auth.signInWithCredential(credentials);
    }
    } on FirebaseAuthException catch(e){
      getErrorSnackbar("Google login Failed", e);
    }
  }

  void forgotPassword(email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      getSuccessSnackBar("Reset mail sent successfully. Check mail!");
    } on FirebaseAuthException catch (e) {
      getErrorSnackbar("Error", e);
    }
  }

  getErrorSnackbar(String message, _) {
    Get.snackbar(
      "Error", 
      "$message\n${_.message}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: MyTheme.redTextColor,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      );
  }

  getErrorSnackBarNew(String message) {
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: MyTheme.redTextColor,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  getSuccessSnackBar(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: MyTheme.greenTextColor,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }
    void signOut() async{
      await auth.signOut();
    }
  }


