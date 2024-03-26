import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:sammyajax/util/constants.dart';
import 'package:toastification/toastification.dart';

class Validations extends ChangeNotifier {
  bool loginValidators(String pwd, String email, BuildContext context) {
    //Validator for login
    if (!RegExp(r'[a-zA-Z]').hasMatch(pwd)) {
      //RegExp(r'[A-Z]'): 'One uppercase letter'
      Constants.alertMsg(context, 'Error', 'Password should have an Uppercase',
          ToastificationType.error);
      return false;
    } else if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(pwd)) {
      //RegExp(r'[!@#\$%^&*(),.?":{}|<>]'): 'One special character'
      Constants.alertMsg(context, 'Error',
          'Password should have a Special Symbol', ToastificationType.error);
      return false;
    } else if (!RegExp(r'\d').hasMatch(pwd)) {
      //RegExp(r'\d'): 'One number'
      Constants.alertMsg(context, 'Error', 'Password should have number',
          ToastificationType.error);
      return false;
    } else if (!RegExp(r'^.{8,32}$').hasMatch(pwd)) {
      //RegExp(r'^.{8,32}$'): '8-32 characters'
      Constants.alertMsg(
          context,
          'Error',
          'Password should be between 8 - 32 characters',
          ToastificationType.error);
      return false;
    } else if (!EmailValidator.validate(email)) {
      //Email Validation
      Constants.alertMsg(
          context, 'Error', 'Invalid Email', ToastificationType.error);
      return false;
    } else {
      return true;
    }
  }

  //Validator for sign up
  bool signupValidators(String name, String email, String phone, String pwd,
      BuildContext context) {
    if (!RegExp(r'[a-zA-Z]').hasMatch(pwd)) {
      //RegExp(r'[A-Z]'): 'One uppercase letter'
      Constants.alertMsg(context, 'Error', 'Password should have an Uppercase',
          ToastificationType.error);
      return false;
    } else if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(pwd)) {
      //RegExp(r'[!@#\$%^&*(),.?":{}|<>]'): 'One special character'
      Constants.alertMsg(context, 'Error',
          'Password should have a Special Symbol', ToastificationType.error);
      return false;
    } else if (!RegExp(r'\d').hasMatch(pwd)) {
      //RegExp(r'\d'): 'One number'
      Constants.alertMsg(context, 'Error', 'Password should have number',
          ToastificationType.error);
      return false;
    } else if (!RegExp(r'^.{8,32}$').hasMatch(pwd)) {
      //RegExp(r'^.{8,32}$'): '8-32 characters'
      Constants.alertMsg(
          context,
          'Error',
          'Password should be between 8 - 32 characters',
          ToastificationType.error);
      return false;
    } else if (!EmailValidator.validate(email)) {
      //Email Validation
      Constants.alertMsg(
          context, 'Error', 'Invalid Email', ToastificationType.error);
      return false;
    } else if (!name.isAlphabet()) {
      //Email Validation
      Constants.alertMsg(context, 'Error', 'Name should be Alphabet',
          ToastificationType.error);
      return false;
    } else if (!phone.isPhone()) {
      //Email Validation
      Constants.alertMsg(
          context, 'Error', 'Invalid Phone Number', ToastificationType.error);
      return false;
    } else {
      return true;
    }
  }
}
