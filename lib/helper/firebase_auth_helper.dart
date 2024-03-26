// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sammyajax/util/constants.dart';
import 'package:sammyajax/util/route.dart';
import 'package:toastification/toastification.dart';

class FirebaseAuthOps {
  //Instance of the FirebaseAuth helper
  static final FirebaseAuthOps firebaseAuthOps = FirebaseAuthOps();

  //Instance of the FirebaseAuth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //get method that return authStateChanges
  Stream<User?> get getAuthState => _firebaseAuth.authStateChanges();

  Future<bool> login(String email, String pwd, BuildContext context) async {
    try {
      //Login Widget or Spinner indicating loading or fetching data
      Constants.showLoader();
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pwd);
      Routes.pop(context);
      return true;
    } on FirebaseAuthException catch (error) {
      //Alert for displaying the error type to the user
      Constants.alertMsg(
          context, 'Error', error.code.toString(), ToastificationType.error);
      return false;
    }
  }

//For Sign up
  Future<bool> sign(String email, String pwd, BuildContext context) async {
    try {
      //Login Widget or Spinner indicating loading or fetching data
      Constants.showLoader();
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: pwd);
      Routes.pop(context);
      return true;
    } on FirebaseAuthException catch (error) {
      //Alert for displaying the error type to the user
      Constants.alertMsg(
          context, 'Error', error.code.toString(), ToastificationType.error);
      return false;
    }
  }
}
